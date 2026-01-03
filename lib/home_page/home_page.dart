import 'package:ecommerce_app/home_page/buttom_nav.dart';
import 'package:ecommerce_app/pages/category_detail.dart';
import 'package:ecommerce_app/pages/product_details.dart';
import 'package:ecommerce_app/pages/see_all_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List categories = [
    // "images/headphone_icon.png",
    "images/laptop_icon.png",
    "images/watch_icon.png",
    "images/mobile_icon.png",
    "images/tv_icon.png",
    
  ];

  List categoryName = [
    // "Headphone",
    "Laptop",
    "Phone",
    "Tv",
    "Watch",
  ];
  bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 199, 198, 198),
      backgroundColor: Color(0xfff2f2f2),
      body: SafeArea(
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
                        'Hey, Aditya',                  // User name
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

                Container(                       // profile image
                  margin: EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: Image.asset(
                      'images/profile_image.avif',
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),

            Container(               // Search bar
              margin: EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
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

            TextWidgets(
              blackText: 'Categories',
              redText: 'See all',
              clickAble: false,
            ),

            Row(                              // list of categories
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


                Expanded(                 // list of categories
                  child: SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(    // whenever any of the category is selected "CategoryDetail" class is called
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CategoryDetail(category: ''),
                              ),
                            );
                          },
                          child: CategorieCard(      // CategorieCard widget is called for each element in "List categories" 
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

            TextWidgets(
              blackText: 'All products',
              redText: 'See all',
              clickAble: true,            // this calles the "SeeAllPage" class (ts not completed yet)
            ),

            Container(             // all the products that are in the app should be visiable here
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


                          return GestureDetector(  // on clicking on any of the product "ProductDetails" class is called
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                    image: "images/headphones.png",
                                    name: "Headphone",
                                    price: 100,
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
                                  Image.asset(
                                    "images/headphones.png",
                                    width: 120,
                                  ),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                        ),
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
                                        padding: const EdgeInsets.only(
                                          right: 10,
                                        ),
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
            ),
          ],
        ),
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
  CategorieCard({required this.image, required this.name});
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
