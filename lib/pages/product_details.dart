import 'dart:convert';
import 'package:ecommerce_app/services/constant.dart';
import 'package:ecommerce_app/services/database.dart';
import 'package:ecommerce_app/services/shared_pref.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class ProductDetails extends StatefulWidget {
  String image;
  String name;
  String price;
  String details;

  ProductDetails({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.details,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String? name, email;

  Future<void> getTheSharedPres() async {
    name = await SharedPref().getUserName();
    email = await SharedPref().getUserEmail();
    setState(() {});
  }

  Future<void> onTheLoad() async {
    await getTheSharedPres();
    setState(() {});
  }

  @override
  void initState() {
    onTheLoad();
    super.initState();
  }

  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff2f2f2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(top: 30, left: 30, bottom: 10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0xfff2f2f2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1.5,
                  color: Colors.black,
                  style: BorderStyle.solid,
                ),
              ),
              child: Icon(Icons.arrow_back, size: 30),
            ),
          ),

          Center(
            child: widget.image == "images/headphones.png"
                ? Image.asset(
                    "images/headphones.png",
                    height: 400,
                    fit: BoxFit.cover,
                  )
                : Image.memory(
                    // Convert base64 string to image
                    base64Decode(widget.image),
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ),
          Spacer(),

          Container(
            color: Colors.white,
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                    left: 15,
                    bottom: 35,
                    top: 40,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        '\$${widget.price}',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.red,
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 15, left: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Detail',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    widget.details,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),

                SizedBox(height: 70),

                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 40,
                    right: 15,
                    left: 15,
                  ),
                  child: TextButton(
                    onPressed: () {
                      makePayment(widget.price);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: Size(double.infinity, 30),
                    ),
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> makePayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'USD');
      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent?['client_secret'],
              style: ThemeMode.dark,
              merchantDisplayName: 'Aditya',
            ),
          )
          .then((value) {});

      displayPamentSheet();
    } catch (e, s) {
      print('exception: $e$s');
    }
  }

  displayPamentSheet() async {
    try {
      await Stripe.instance
          .presentPaymentSheet()
          .then((value) async {
            Map<String, dynamic> orderInfoMap = {
              'Product': widget.name,
              'Price': widget.price,
              'ProductImage': widget.image,
              'Name': name,
              'Email': email,
            };
           // this gives the FireBase all the info related to the product and the user who ordered it
            await DatabaseMethods().orderDetails(orderInfoMap);

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.greenAccent),
                        Text("Payment Successfull"),
                      ],
                    ),
                  ],
                ),
              ),
            );
            paymentIntent = null;
          })
          .onError((error, StackTrace) {
            print('Error -------> $error $StackTrace');
          });
    } on StripeException catch (e) {
      print('Error -------> $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(content: Text('Cancelled')),
      );
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );
      return jsonDecode(response.body);
    } catch (e) {
      print('error chorging user: ${e.toString()}');
    }
  }

  String calculateAmount(String amount) {
    final calculateAmount = (int.parse(amount) * 100);
    return calculateAmount.toString();
  }
}
