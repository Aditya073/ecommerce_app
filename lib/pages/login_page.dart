import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Color.fromARGB(255, 0, 0, 255),
        margin: EdgeInsets.only(top: 20, right: 15, left: 15, bottom: 10),
        child: Column(
          children: [
            Center(
              child: Image.asset('images/login_.png', width: double.infinity),
            ),

            
            SizedBox(height: 10),
            
            
            Text(
              'Sign In',
              style: TextStyle(
                // decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),


            SizedBox(height: 10),
            
            
            Text(
              'please enter the details below to continue.',
              style: TextStyle(
                // decoration: TextDecoration.none,
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
                                      // 1:41:51
          ],
        ),
      ),
    );
  }
}
