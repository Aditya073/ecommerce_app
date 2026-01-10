import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/home_page/all_product_display.dart';
import 'package:ecommerce_app/home_page/buttom_nav.dart';
import 'package:ecommerce_app/pages/category_detail.dart';
import 'package:ecommerce_app/pages/product_details.dart';
import 'package:ecommerce_app/pages/see_all_page.dart';
import 'package:ecommerce_app/services/database.dart';
import 'package:ecommerce_app/services/shared_pref.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List categories = [
    "images/headphone_icon.png",
    "images/laptop_icon.png",
    "images/watch_icon.png",
    "images/mobile_icon.png",
    "images/tv_icon.png",
  ];

  List categoryName = ["Headphone", "Laptop", "Watch", "Phone", "Tv"];
  bool? isSelected;
  bool search = false;
  var quaryResultSet = [];
  var tempSearchStore = [];

  void initiateSearch(String value) {
    if (value.isEmpty) {
      // User has not typed anything
      setState(() {
        search = false;
        quaryResultSet.clear();
        tempSearchStore.clear();
      });
      return;
    }

    setState(() {
      search = true;
    });

    String searchKey = value
        .toUpperCase(); // this stores the value that user has typed

    if (quaryResultSet.isEmpty && value.length == 1) {
      DatabaseMethods().search(searchKey).then((QuerySnapshot docs) {
        setState(() {
          quaryResultSet = docs.docs.map((e) => e.data()).toList();
          tempSearchStore = quaryResultSet;
        });
      });
    } else {
      setState(() {
        tempSearchStore = quaryResultSet.where((element) {
          return element['UpdatedName'].toString().startsWith(searchKey);
        }).toList();
      });
    }
  }

  String? name, image;

  Future<void> getTheSharedPres() async {
    name = await SharedPref().getUserName();
    // image = await SharedPref().getUserImage();
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

  @override
  Widget build(BuildContext context) {
    return name == null
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            // backgroundColor: Color.fromARGB(255, 199, 198, 198),
            backgroundColor: Color(0xfff2f2f2),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              Text(
                                'Hey, ' + name!, // User name
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Welcome',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          // profile image
                          margin: EdgeInsets.only(right: 20),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xfff2f2f2),
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Icon(Icons.person, size: 50),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      // Search bar
                      margin: EdgeInsets.only(
                        right: 20,
                        left: 20,
                        top: 30,
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          initiateSearch(value);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          hint: Text(
                            'Search products',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),

                    search
                        ? ListView(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            primary: false,
                            shrinkWrap: true,
                            children: tempSearchStore.map((element) {
                              return builtResultCard(element);
                            }).toList(),
                          )
                        : Container(
                            margin: EdgeInsets.all(10),
                            child: TextWidgets(
                              blackText: 'Categories',
                              redText: 'See all',
                              clickAble: false,
                            ),
                          ),

                    Row(
                      // list of categories
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 150,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'All',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          // list of categories
                          child: SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  // whenever any of the category is selected "CategoryDetail" class is called
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CategoryDetail(category: ''),
                                      ),
                                    );
                                  },
                                  child: CategorieCard(
                                    // CategorieCard widget is called for each element in "List categories"
                                    image: categories[index],
                                    name: categoryName[index],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextWidgets(
                        blackText: 'All products',
                        redText: 'See all',
                        clickAble:
                            true, // this calles the "SeeAllPage" class (ts not completed yet)
                      ),
                    ),

                    AllProductDisplay(), // this displays all the product in a row
                  ],
                ),
              ),
            ),
          );
  }

  Widget builtResultCard(data) {
    // used to add the product name and image when user is searching for the product
    return Container(
      color: Colors.white,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(width: 30),
          ClipRRect(
            // the image
            borderRadius: BorderRadius.circular(20),
            child: Image.memory(
              base64Decode(data['imageBase64']),
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          GestureDetector(
            onTap: () {
              // this re-directs the user to the "ProductDetails" page of the particular product
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    image: data['imageBase64'],
                    name: data['name'],
                    price: data['Price'],
                    details: data['Detail'],
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                // the text
                data['name'],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextWidgets extends StatelessWidget {
  String blackText;
  String redText;
  bool clickAble;

  // this is a constructor
  TextWidgets({
    super.key,
    required this.blackText,
    required this.redText,
    required this.clickAble,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            blackText,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 20,
            ),
          ),

          GestureDetector(
            onTap: () {
              if (clickAble) {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => SeeAllPage()));
              }
            },
            child: Text(
              redText,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.red,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategorieCard extends StatelessWidget {
  String image, name;
  // this is a constructor
  CategorieCard({super.key, required this.image, required this.name});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryDetail(category: name),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        // height: 90,
        width: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
              child: Image.asset(image),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
