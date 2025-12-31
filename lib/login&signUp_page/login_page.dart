import 'package:ecommerce_app/home_page/buttom_nav.dart';
import 'package:ecommerce_app/login&signUp_page/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userEmailID = TextEditingController();
  final userPassword = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  userLogin() async {
    // sign in method
    if (userEmailID != null && userPassword != null) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmailID.text.trim(),
          password: userPassword.text.trim(),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.greenAccent,
            content: Text('Login Successfully', style: TextStyle(fontSize: 20)),
          ),
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ButtomNav()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text("User not found", style: TextStyle(fontSize: 20)),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "Wrong Email or password",
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          // color: Color.fromARGB(255, 0, 0, 255),
          margin: EdgeInsets.only(top: 20, right: 15, left: 15, bottom: 10),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'images/login_.png',
                    width: double.infinity,
                  ),
                ),

                SizedBox(height: 10),

                Center(
                  child: Text(
                    'Sign In',
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
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Email';
                      } else {
                        return null;
                      }
                    },
                    controller: userEmailID,
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
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Password';
                      } else {
                        return null;
                      }
                    },
                    controller: userPassword,
                    decoration: InputDecoration(
                      hint: Text('Password'),
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),
                Center(
                  child: TextButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        setState(() {});
                      }
                      userLogin();
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.green,
                      minimumSize: Size(140, 50),
                    ),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
