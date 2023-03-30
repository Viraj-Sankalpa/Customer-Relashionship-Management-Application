import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomerSearchScreen extends StatefulWidget {
  const CustomerSearchScreen({Key? key}) : super(key: key);

  @override
  State<CustomerSearchScreen> createState() => _CustomerSearchScreenState();
}

class _CustomerSearchScreenState extends State<CustomerSearchScreen> {
  List searchResult = [];

  void searchFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('customers')
        // .where('string_id_array', arrayContains: query)
        .where('firstName')
        .get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search Here",
              ),
              onChanged: (query) {
                searchFromFirebase(query);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResult.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchResult[index]['firstName']),
                  subtitle: Text(searchResult[index]['phone1']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
