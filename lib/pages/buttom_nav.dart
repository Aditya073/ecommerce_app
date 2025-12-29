import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_app/pages/Order.dart';
import 'package:ecommerce_app/pages/Profile.dart';
import 'package:ecommerce_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class ButtomNav extends StatefulWidget {
  const ButtomNav({super.key});

  @override
  State<ButtomNav> createState() => _ButtomNavState();
}

class _ButtomNavState extends State<ButtomNav> {
  late List<Widget> pages;

  late HomePage homePage;
  late Order order;
  late Profile profile;
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
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(microseconds: 500),
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
      body: pages[currentTabIndex],
    );
  }
}
