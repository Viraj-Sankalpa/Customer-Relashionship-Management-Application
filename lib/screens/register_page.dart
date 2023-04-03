import 'dart:io';
import 'package:cdms/screens/login.dart';
import 'package:cdms/screens/signin_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  bool checkedValue = false;
  bool showSnipper = false;
  bool checkboxValue = false;
  late TextEditingController firstName = TextEditingController();
  late TextEditingController lastName = TextEditingController();
  late TextEditingController phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();


  bool isLoading = false;

  @override


  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  Lottie.network(
                      "https://assets8.lottiefiles.com/packages/lf20_9cyyl8i4.json"),
                  const SizedBox(
                    height: 10,
                  ),
                  //title

                  const Text(
                    "Register",
                    style: TextStyle(fontSize: 24),
                  ),

                  //first name text field
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("First Name"),
                      prefixIcon: Icon(Icons.person_3_rounded),
                      // labelStyle: TextStyle(color: Colors.yellowAccent),
                      // border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      firstName.text = value;
                    },
                  ),

                  //last name
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Last Name"),
                      prefixIcon: Icon(Icons.person_3_rounded),
                      // labelStyle: TextStyle(color: Colors.yellowAccent),
                      // border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      lastName.text = value;
                    },
                  ),

                  //email
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      label: Text("Email"),
                      prefixIcon: Icon(Icons.email_rounded),
                      // labelStyle: TextStyle(color: Colors.yellowAccent),
                      // border: OutlineInputBorder(),
                    ),
                    validator: (val) {
                      // ignore: prefer_is_not_empty
                      if (!(val!.isEmpty) &&
                          !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                              .hasMatch(val)) {
                        return "Enter a valid email address";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _email.text = value;
                    },
                  ),

                  //password
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text("Password"),
                      prefixIcon: Icon(Icons.password_rounded),

                      // labelStyle: TextStyle(color: Colors.yellowAccent),
                      // border: OutlineInputBorder(),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _password.text = value;
                    },
                  ),

                  //telephone number
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Phone"),
                      prefixIcon: Icon(Icons.phone_in_talk_rounded),
                      // labelStyle: TextStyle(color: Colors.yellowAccent),
                      // border: OutlineInputBorder(),
                    ),
                    validator: (val) {
                      // ignore: prefer_is_not_empty
                      if (!(val!.isEmpty) &&
                          !RegExp(r"^(\d+)*$").hasMatch(val)) {
                        return "Enter a valid phone number";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      phone.text = value;
                    },
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        elevation: 3,
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(20)),
                        // padding: const EdgeInsets.symmetric(
                        //     vertical: 15, horizontal: 130),
                      ),
                      onPressed: () async {
                        setState(() {
                          showSnipper = true;
                        });

                        try {
                          setState(() {
                            isLoading = true;
                          });

                          final UserCredential newUser =
                              await _auth.createUserWithEmailAndPassword(
                            email: _email.text,
                            password: _password.text,
                          );
                          if (newUser.user != null &&
                              newUser.user!.email != null) {
                            _firestore
                                .collection('users')
                                .doc(_email.text)
                                .set({
                              'firstName': firstName.text,
                              'lastName': lastName.text,
                              'email': _email.text,
                              'phone': phone.text,
                            });
                            

                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                                (Route<dynamic> route) => false);
                          }
                          setState(() {
                            isLoading = false;
                          });
                        } catch (e) {
                          const AlertDialog(
                            title: Text("Error"),
                          );

                          // ignore: avoid_print
                          print(e);
                          setState(() {
                            isLoading = false;
                          });
                        }
                        // Navigator.pushNamed(context, '/Home');
                      },
                      child: const Text("Register")),

                  const SizedBox(
                    height: 15,
                  ),

                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/LogIn');
                      },
                      child: const Text("LogIn"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
