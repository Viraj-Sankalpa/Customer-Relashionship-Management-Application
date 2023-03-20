import 'package:cdms/screens/add_customer.dart';
import 'package:cdms/screens/home_page.dart';
import 'package:cdms/screens/login.dart';
import 'package:cdms/screens/register_page.dart';
import 'package:cdms/screens/signin_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
);
 
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

        primarySwatch: Colors.lime,
      ),
      // home: const RegisterPage(),
      home: const LoginPage(),

      routes: {
        '/Home' :(context) => const HomePage(),
        '/SignIn' :(context) => const SignInPage(),
        '/AddCustomer' :(context) => const AddCustomer(),
      },
    );
  }
}

