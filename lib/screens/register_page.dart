import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.lime, 
                        
                        elevation: 3, 
                        shape: RoundedRectangleBorder(
                           
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 130),

                    
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/Home');
                      },
                      child: const Text("Register"))
                                  ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
