import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          // color: Color.fromARGB(255, 0, 0, 255),
          margin: EdgeInsets.only(top: 20, right: 15, left: 15, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset('images/login_.png', width: double.infinity),
              ),

              SizedBox(height: 10),

              Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    // decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 10),

              Center(
                child: Text(
                  'please enter the details below to \n                   continue.',
                  style: TextStyle(
                    // decoration: TextDecoration.none,
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 30),

              Text(
                'Name',
                style: TextStyle(
                  // decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 227, 227, 228),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hint: Text('Name'),
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Text(
                'Email',
                style: TextStyle(
                  // decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 227, 227, 228),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hint: Text('Email'),
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Text(
                'Password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 227, 227, 228),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hint: Text('Password'),
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Text(
              //         'Forgot Password?',
              //         style: TextStyle(
              //           color: Colors.green,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 16,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    backgroundColor: Colors.green,
                    minimumSize: Size(140, 50),
                  ),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         'Don\'t have an account? ',
              //         style: TextStyle(
              //           color: Colors.grey,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 16,
              //         ),
              //       ),
              //       Text(
              //         'Sign Up',
              //         style: TextStyle(
              //           color: Colors.green,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 16,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
