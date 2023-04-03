import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password;

  @override
  // void initState(){
  //   super.initState();
  //   _email = "email";
  //   _password = "password";
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Login"),
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 40,),
      
                  Lottie.network("https://assets5.lottiefiles.com/packages/lf20_ey576j6e.json"),
                  const Padding(padding: EdgeInsets.all(20)),
                  TextFormField(
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Please type an email';
                      }
                      return null;
                    },
                    onSaved: (input) => _email = input!,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  TextFormField(
                    validator: (input) {
                      if (input!.length < 6) {
                        return 'Your password needs to be at least 6 characters';
                      }
                      return null;
                    },
                    onSaved: (input) => _password = input!,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 15.0,),
                  ElevatedButton(
                    onPressed: signIn,
                    child: const Text('Log In'),
                  ),

                  const SizedBox(height: 15.0,),
      
                  ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, '/Register');
                  }, child: const Text("Register Here"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState!.validate()) {
      formState.save();
      try {
        UserCredential user =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        // Navigator.pushReplacementNamed(context, '/Home');
        Navigator.pushReplacementNamed(context, '/Search');
      } catch (e) {
        // print(e.message);
      }
    }
  }
}
