import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  final _firestore = FirebaseFirestore.instance;
  // final _auth = FirebaseAuth.instance;
  bool checkedValue = false;
  bool showSnipper = false;
  bool checkboxValue = false;
  late TextEditingController firstName = TextEditingController();
  late TextEditingController lastName = TextEditingController();

  late TextEditingController phone1 = TextEditingController();
  late TextEditingController phone2 = TextEditingController();
  late TextEditingController landNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController designation = TextEditingController();
  late String dropdownValue = 'Option 1';

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 10,
              ),
              //title
              const Text(
                "Add New Customer",
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

              //telephone number 1
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Phone 1"),
                  prefixIcon: Icon(Icons.phone_iphone_rounded),
                  // labelStyle: TextStyle(color: Colors.yellowAccent),
                  // border: OutlineInputBorder(),
                ),
                validator: (val) {
                  // ignore: prefer_is_not_empty
                  if (!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)) {
                    return "Enter a valid phone number";
                  }
                  return null;
                },
                onChanged: (value) {
                  phone1.text = value;
                },
              ),

              //telephone number 2
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Phone 2"),
                  prefixIcon: Icon(Icons.phone_iphone_rounded),
                  // labelStyle: TextStyle(color: Colors.yellowAccent),
                  // border: OutlineInputBorder(),
                ),
                validator: (val) {
                  // ignore: prefer_is_not_empty
                  if (!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)) {
                    return "Enter a valid phone number";
                  }
                  return null;
                },
                onChanged: (value) {
                  phone2.text = value;
                },
              ),

              //Land Number
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Land Number"),
                  prefixIcon: Icon(Icons.phone_in_talk_rounded),
                  // labelStyle: TextStyle(color: Colors.yellowAccent),
                  // border: OutlineInputBorder(),
                ),
                validator: (val) {
                  // ignore: prefer_is_not_empty
                  if (!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)) {
                    return "Enter a valid phone number";
                  }
                  return null;
                },
                onChanged: (value) {
                  landNumber.text = value;
                },
              ),

              //Designation
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Designation"),
                  prefixIcon: Icon(Icons.person_3_rounded),
                  // labelStyle: TextStyle(color: Colors.yellowAccent),
                  // border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  designation.text = value;
                },
              ),

              //select company
              const SizedBox(
                height: 20,
              ),
              DropdownButton<String>(
                
                value: dropdownValue, // current value of dropdown menu
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue =
                        newValue!; // update dropdownValue when value is changed
                  });
                },
                items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              const SizedBox(
                height: 25,
              ),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 130),
                  ),
                  onPressed: () async {
                    setState(() {
                      showSnipper = true;
                    });

                    _firestore.collection('customers').doc(_email.text).set({
                      'firstName': firstName.text,
                      'lastName': lastName.text,
                      'email': _email.text,
                      'phone1': phone1.text,
                      'phone2': phone2.text,
                      'landNumber': landNumber.text,
                      'designation': designation.text,
                    });

                    _firestore
                        .collection('organization')
                        .doc(_email.text)
                        .set({
                          'dropdownValue': dropdownValue,
                        });

                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const AddCustomer()),
                        (Route<dynamic> route) => false);

                    // Navigator.pushNamed(context, '/Home');
                  },
                  child: const Text("Submit")),
            ]),
          ),
        ),
      ),
    );
  }
}
