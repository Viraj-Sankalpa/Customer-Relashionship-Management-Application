import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../details_page.dart';

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
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text("Customer Search"),
      // ),
      body: Column(
        children: [
          const SizedBox(
                height: 20,
              ),
              //title
              const Text(
                "Search Customer",
                style: TextStyle(fontSize: 24, ),
              ),
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
                  title: Text(searchResult[index]['firstName'].toString()),
                  subtitle: Text(searchResult[index]['phone1'].toString()),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomerProfileScreen(
                            customer: searchResult[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/AddCustomer');
                },
                child: const Text("Add New Customer")),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/AllCustomers');
                },
                child: const Text("All Customers")),
          )
        ],
      ),
    );
  }
}
