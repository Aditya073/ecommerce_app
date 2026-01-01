import 'package:ecommerce_app/Admin/add_product.dart';
import 'package:ecommerce_app/login&signUp_page/firebase_options.dart';
import 'package:ecommerce_app/home_page/onbording_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AddProduct());
  }
}                                            // 3:05:08
