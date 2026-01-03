import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_app/pages/Order.dart';
import 'package:ecommerce_app/pages/Profile.dart';
import 'package:ecommerce_app/home_page/home_page.dart';
import 'package:ecommerce_app/login&signUp_page/login_page.dart';
import 'package:flutter/material.dart';

class ButtomNav extends StatefulWidget {
  const ButtomNav({super.key});

  @override
  State<ButtomNav> createState() => _ButtomNavState();
}

class _ButtomNavState extends State<ButtomNav> {  // this file manages the flow of the user from home page, order page and Profile page
  late List<Widget> pages;


  late HomePage homePage;  // HomePage class
  late Order order;        // Order class
  late Profile profile;    // Profile class
  int currentTabIndex = 0;

  @override
  void initState() {

    homePage = HomePage();
    order = Order();
    profile = Profile();

    pages = [homePage, order, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      bottomNavigationBar: CurvedNavigationBar( // this is the buttom navigation bar 
        height: 65,
        backgroundColor: Color(0xfff2f2f2),
        color: Colors.black,
        animationDuration: Duration(microseconds: 12000),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },

        items: [
          Icon(Icons.home_outlined, color: Colors.white),
          Icon(Icons.shopping_cart_outlined, color: Colors.white),
          Icon(Icons.person_2_outlined, color: Colors.white),
        ],
      ),


      body: pages[currentTabIndex],  // body changes its state
    );
  }
}
