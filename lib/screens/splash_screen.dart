// import 'package:cdms/screens/home_page.dart';
import 'package:cdms/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: kAlwaysCompleteAnimation,
                child: Container(
                  child: Lottie.network("https://assets6.lottiefiles.com/packages/lf20_jrpzvtqz.json"),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                child: const Center(
                  child: Text(
                    "Customer Details Tracker",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30, color: Color.fromARGB(255, 75, 74, 71)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}