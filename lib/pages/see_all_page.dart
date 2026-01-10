import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/pages/product_details.dart';
import 'package:ecommerce_app/services/database.dart';
import 'package:flutter/material.dart';

class SeeAllPage extends StatefulWidget {
  const SeeAllPage({super.key});

  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  // Stream that continuously listens to Firestore product changes
  late final seeAllProducts;

  // Called once when the page loads
  // Fetches products of the selected category
  Future<void> getOnTheLoad() async {
    seeAllProducts = await DatabaseMethods().getAllProducts();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getOnTheLoad();
  }

  Widget viewProducts() {
    return StreamBuilder<QuerySnapshot>(
      stream: seeAllProducts,

      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          // Grid layout (2 items per row)
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data!.docs[index];
            final imageBase64 = ds["imageBase64"];

            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    // product image
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: imageBase64 == null
                        ? const SizedBox(
                            height: 150,
                            child: Icon(Icons.image_not_supported),
                          )
                        : Image.memory(
                            // Convert base64 string to image
                            base64Decode(imageBase64),
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      // product details
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // product name
                          ds['name'] ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              // product price
                              "\$${ds['Price']}",
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),

                            // ADD BUTTON
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                      image: imageBase64,
                                      name: ds['name'],
                                      price: ds['Price'],
                                      details: ds['Detail'],
                                    ),
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      appBar: AppBar(
        backgroundColor: const Color(0xfff2f2f2),
        elevation: 0,
        leading: IconButton(
          // back icon
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          // text on the app bar
          'All products', // based on the selected category
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: viewProducts(), // the main body of the page
    );
  }
}
