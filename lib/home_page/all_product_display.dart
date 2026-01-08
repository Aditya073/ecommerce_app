import 'package:ecommerce_app/pages/product_details.dart';
import 'package:flutter/material.dart';

class AllProductDisplay extends StatefulWidget {
  const AllProductDisplay({super.key});

  @override
  State<AllProductDisplay> createState() => _AllProductDisplayState();
}

class _AllProductDisplayState extends State<AllProductDisplay> {
  @override
  Widget build(BuildContext context) {
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
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    // on clicking on any of the product "ProductDetails" class is called
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(
                            image: "images/headphones.png",
                            name: "Headphone",
                            price: "100",
                            details: "Good product",
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
                          Image.asset("images/headphones.png", width: 120),
                          SizedBox(height: 5),
                          Text(
                            'Headphone',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  '\$100',
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
                                  child: Icon(Icons.add, color: Colors.white),
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
  }
}
