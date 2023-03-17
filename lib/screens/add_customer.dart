import 'package:cdms/screens/theme_helper.dart';
import 'package:flutter/material.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  bool checkedValue = false;
  bool showSnipper = false;
  bool checkboxValue = false;
  bool isLoading = false;
  late TextEditingController firstName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              decoration: ThemeHelper()
                  .textInputDecoration('First Name', 'Enter your first name'),
              onChanged: (value) {
                firstName.text = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
