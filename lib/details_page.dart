import 'package:flutter/material.dart';

class CustomerProfileScreen extends StatelessWidget {
  final Map<String, dynamic> customer;

  const CustomerProfileScreen({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${customer['firstName']} ${customer['lastName']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${customer['firstName']} ${customer['lastName']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Email: ${customer['email']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Phone Number 1: ${customer['phone1']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Phone Number 2: ${customer['phone2']}',
              style: const TextStyle(fontSize: 16),
            ),
            // Add other fields as necessary
          ],
        ),
      ),
    );
  }
}
