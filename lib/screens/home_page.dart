import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    final databaseRef = FirebaseDatabase.instance.ref().child('customers');
  late String firstName = '';
  late Map<String, dynamic> customers;

  Future<void> _getCustomerDetails(String firstName) async {
    final customerSnapshot = await databaseRef.child(firstName).once();
    // setState(() {
    //   customers = customerSnapshot.value;
    // });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        
        child: Container(
          
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                TextField(
              onChanged: (value) => setState(() => firstName = value),
              decoration: const InputDecoration(
                labelText: 'Enter customer name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _getCustomerDetails(firstName),
              child: const Text('Get customer details'),
            ),
            const SizedBox(height: 16),
            // if (customers != null)
              Text('firstName: ${customers['firstName']}'),
              Text('email: ${customers['email']}'),
              Text('Phone1: ${customers['phone']}'),
                
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Search Customer or Company",
                  style: TextStyle(fontSize: 24, ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(20),
                    // ),
                    // ),
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                    onPressed: () {},
                    child: const Text("Search")),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Add Customer or Company",
                  style: TextStyle(fontSize: 24,),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/AddCustomer');
                    },
                    child: const Text("+")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
