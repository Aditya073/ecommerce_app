import 'package:ecommerce_app/pages/buttom_nav.dart';
import 'package:ecommerce_app/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController newUseEmailID = TextEditingController();
  final TextEditingController newUsePassword = TextEditingController();
  final TextEditingController newUseName = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (newUseName != null && newUseEmailID != null && newUsePassword != null) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: newUseEmailID.text.trim(),
              password: newUsePassword.text.trim(),
            );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.greenAccent,
            content: Text(
              'Registered Successfully',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );

        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => ButtomNav()));
      } on FirebaseException catch (e) {
        if (e.code == "weak-password") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text("Weak Password", style: TextStyle(fontSize: 20)),
            ),
          );
        }
        if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "Email Already exesists",
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
                    'Sign Up',
                    style: TextStyle(
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
                        return 'Please enter your Name';
                      } else {
                        return null;
                      }
                    },
                    controller: newUseName,
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
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Email';
                      } else {
                        return null;
                      }
                    },
                    controller: newUseEmailID,
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
                    controller: newUsePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      hint: Text('Password'),
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Center(
                  child: TextButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        setState(() {});
                      }
                      registration();
                    },
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

                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign In',
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
