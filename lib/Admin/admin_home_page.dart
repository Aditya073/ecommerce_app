import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

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