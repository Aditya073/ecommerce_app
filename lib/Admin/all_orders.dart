import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/services/database.dart';
import 'package:ecommerce_app/services/shared_pref.dart';
import 'package:flutter/material.dart';

class AllOrders extends StatefulWidget {
  const AllOrders({super.key});

  @override
  State<AllOrders> createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  String? email;

  Future<void> getTheSharedPres() async {
    email = await SharedPref().getUserEmail();
    setState(() {});
  }

  Stream? orderStream;
  // Called once when the page loads
  // Fetches products of the selected category
  Future<void> getOnTheLoad() async {
    await getTheSharedPres();
    orderStream = await DatabaseMethods().allOrders();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  Widget allProducts() {
    // Builds the product grid this is the main body
    return StreamBuilder(
      stream: orderStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),

          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];

            return Column(
              children: [
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),

                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 10,
                      right: 20,
                      bottom: 10,
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.memory(
                              // Convert base64 string to image
                              base64Decode(ds['ProductImage']),
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ds['Product'],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'User Email : ' + ds['Email'],
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        'User Name : ' + ds['Name'],
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 12,
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(
                                          '\$' + ds['Price'],
                                          style: TextStyle(
                                            color: Colors.green.shade700,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            await DatabaseMethods()
                                                .updateStatus(ds.id);
                                            setState(() {});
                                          },
                                          child: Text('Done'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ), 
                // Wrap the Material widget with a column widget then add this
                // This makes so that the containets don't collide
                const SizedBox(height: 20),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xfff2f2f2),
        title: Text(
          'All Order',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(children: [Expanded(child: allProducts())]),
      ),
    );
  }
}
