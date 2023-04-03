import 'package:flutter/material.dart';

class CustomerProfileScreen extends StatelessWidget {
  final Map<String, dynamic> customer;

  const CustomerProfileScreen({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(customer['firstName']),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(customer['firstName']),
            Text(customer['phone1']),
            // Add other fields as necessary
          ],
        ),
      ),
    );
  }
}
