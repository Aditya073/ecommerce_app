import 'package:ecommerce_app/Admin/add_product.dart';
import 'package:ecommerce_app/Admin/admin_home_page.dart';
import 'package:ecommerce_app/Admin/admin_login_page.dart';
import 'package:ecommerce_app/home_page/buttom_nav.dart';
import 'package:ecommerce_app/login&signUp_page/firebase_options.dart';
import 'package:ecommerce_app/home_page/onbording_page.dart';
import 'package:ecommerce_app/login&signUp_page/login_page.dart';
import 'package:ecommerce_app/services/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Stripe.publishableKey = publishableKey!;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ButtomNav());
  }
}                                 // 5:13:00