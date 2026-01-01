import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100,),

          Text('Hiiiiiiiiiiiiiiiii', style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold
          ),)

        ],
      ),
    );
  }
}