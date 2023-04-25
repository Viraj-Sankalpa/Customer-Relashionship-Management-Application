// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class MyDropdownMenu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('organizations').snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const CircularProgressIndicator();
//         }

//         List<DropdownMenuItem<String>> dropdownItems = snapshot.data!.docs.map((DocumentSnapshot doc) {
//           String orgName = doc.data()['name'];
//           return DropdownMenuItem<String>(
//             value: orgName,
//             child: Text(orgName),
//           );
//         }).toList();

//         return DropdownButtonFormField<String>(
//           items: dropdownItems,
//           onChanged: (String? value) {
//             // Handle dropdown value change
//             print('Selected value: $value');
//           },
//           decoration: const InputDecoration(
//             labelText: 'Organization',
//             border: OutlineInputBorder(),
//           ),
//         );
//       },
//     );
//   }
// }
