import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Admin/admin_home_page.dart';
import 'package:flutter/material.dart';

class AdminLoginPage extends StatefulWidget {
  AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<AdminLoginPage> {
  final userName = TextEditingController();
  final userPassword = TextEditingController();

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
                  'Admin Panel',
                  style: TextStyle(
                    // decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 20),

              Text(
                'Username',
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
                  controller: userName,
                  decoration: InputDecoration(
                    hint: Text('Name'),
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
                  controller: userPassword,
                  decoration: InputDecoration(
                    hint: Text('Password'),
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),

              SizedBox(height: 40),

              Center(
                child: TextButton(
                  onPressed: () {
                    // calling the function to verify the Username and Password  
                    loginAdmin();
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
            ],
          ),
        ),
      ),
    );
  }

  void loginAdmin() {
    FirebaseFirestore.instance.collection('Admin').get().then((snapshot) {
      for (var result in snapshot.docs) {
        if (result.data()['Username'] != userName.text.trim() || result.data()['Password'] != userPassword.text.trim()){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "Wrong UserName or Password",
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
        // else if (result.data()['Password'] != userPassword.text.trim()) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       backgroundColor: Colors.redAccent,
        //       content: Text(
        //         "Wrong Password",
        //         style: TextStyle(fontSize: 20),
        //       ),
        //     ),
        //   );
        // } 
        else {
          
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdminHomePage()),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.greenAccent,
              content: Text(
                "Login Successfull",
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
          
        }
      }
    });
  }
}
