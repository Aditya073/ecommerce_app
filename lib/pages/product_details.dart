import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  String image;
  String name;
  int price;

  ProductDetails({
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    String textttt =
        "The product is very good. It have a 1 year waranty,These headphones are too good like you can also listen a person who is speaking loudly. But be aware of shivam he speaks very loudly ";

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

          Center(child: Image.asset(image, height: 400)),

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
                        name,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        '\$$price',
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
                    textttt,
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
                    onPressed: () {},
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
}
// SizedBox(height: 30,),
          // Text(name, style: TextStyle(
          //   fontSize: 30,
          //   fontWeight: FontWeight.w500,
          //   fontStyle: FontStyle.italic
          // ),)