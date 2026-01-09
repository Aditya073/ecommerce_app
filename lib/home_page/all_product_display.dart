import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/pages/product_details.dart';
import 'package:ecommerce_app/services/database.dart';
import 'package:flutter/material.dart';

class AllProductDisplay extends StatefulWidget {
  const AllProductDisplay({super.key});

  @override
  State<AllProductDisplay> createState() => _AllProductDisplayState();
}

class _AllProductDisplayState extends State<AllProductDisplay> {
  // Stream that continuously listens to Firestore product changes
  late final AllProductDisplay;

  // Called once when the page loads
  // Fetches products of the selected category
  Future<void> getOnTheLoad() async {
    AllProductDisplay = await DatabaseMethods().getAllProducts();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getOnTheLoad();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: AllProductDisplay,

      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container(
          // all the products that are in the app should be visiable here
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          width: double.infinity,
          height: 250,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 230,
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot ds = snapshot.data!.docs[index];
                      print(ds['name']);
                      print(ds['Price']);
                      print(ds['Detail']);
                      print(ds['name']);
                      // final imageBase64 = ds["imageBase64"];

                      return GestureDetector(
                        // on clicking on any of the product "ProductDetails" class is called
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                image: ds['imageBase64'],
                                name: ds['name'],
                                price: ds['Price'],
                                details: ds['Detail'],
                              ),
                            ),
                          );
                        },

                        child: Container(
                          width: 190,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),

                          child: Column(
                            children: [
                              Image.memory(ds['imageBase64'], width: 120),
                              SizedBox(height: 5),
                              Text(
                                ds['name'],

                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,

                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      '\$${ds['Price']}',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        minimumSize: Size(3, 5),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
