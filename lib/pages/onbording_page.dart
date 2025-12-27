import 'package:ecommerce_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class OnbordingPage extends StatefulWidget {
  const OnbordingPage({super.key});

  @override
  State<OnbordingPage> createState() => _OnbordingPageState();
}

class _OnbordingPageState extends State<OnbordingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 213, 213, 212), //Color(0xffecefe8)
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("images/headphones.png"),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    'Explore\nThe best\nProducts',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 42),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 0, 0),
                      padding: EdgeInsets.all(30),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Color.fromARGB(255, 229, 229, 229),
                        fontSize: 22,
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
