import 'package:cdms/screens/add_customer.dart';
import 'package:cdms/screens/all_customers.dart';
import 'package:cdms/screens/search_customer.dart';
import 'package:cdms/screens/login.dart';
import 'package:cdms/screens/register_page.dart';
import 'package:cdms/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Customer Relationship Management',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      // home: CustomerDetailsPage(),
      home: const SplashScreen(),

      routes: {
        '/Search': (context) => const CustomerSearchScreen(),
        '/Register': (context) => const RegisterPage(),
        '/LogIn': (context) => const LoginPage(),
        '/AddCustomer': (context) => const AddCustomer(),
        '/AllCustomers': (context) =>  AllCustomers(),
      },
    );
  }
}
