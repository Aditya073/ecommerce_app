import 'package:flutter_dotenv/flutter_dotenv.dart';

final publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'];
final secretKey = dotenv.env['STRIPE_SECRET_KEY'];
