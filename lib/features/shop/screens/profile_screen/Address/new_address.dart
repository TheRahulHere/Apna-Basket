import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddressFormPage extends StatelessWidget {
  final Function(Map<String, dynamic>) onAddressSubmitted;

  AddressFormPage({super.key, required this.onAddressSubmitted});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery Address"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<List<Map<String, dynamic>>>(
          stream: fetchSavedAddresses(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            // Fetch saved addresses dynamically
            final savedAddresses = snapshot.data ?? [];
            // Remove duplicates
            final uniqueAddresses = savedAddresses.toSet().toList();

            return Form(
              key: _formKey,
              child: ListView(
                children: [
                  // Dropdown for Saved Addresses
                  if (uniqueAddresses.isNotEmpty) ...[
                    const Text("Select Saved Address"),
                    DropdownButtonFormField<Map<String, dynamic>>(
                      value: uniqueAddresses.firstWhere(
                            (address) =>
                        address['phone'] == _phoneController.text &&
                            address['street'] == _streetController.text &&
                            address['city'] == _cityController.text &&
                            address['state'] == _stateController.text,
                        orElse: () => {},
                      ),
                      items: uniqueAddresses.map((address) {
                        return DropdownMenuItem<Map<String, dynamic>>(
                          value: address,
                          child: Text(
                            "${address['street']}, ${address['city']}, ${address['state']}",
                          ),
                        );
                      }).toList(),
                      onChanged: (address) {
                        if (address != null) {
                          _phoneController.text = address['phone'];
                          _streetController.text = address['street'];
                          _cityController.text = address['city'];
                          _stateController.text = address['state'];
                        }
                      },
                      decoration: const InputDecoration(labelText: "Saved Addresses"),
                    ),
                  ],
                  // Manual Address Form
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(labelText: "Phone"),
                    validator: (value) =>
                    value!.isEmpty ? "Enter phone number" : null,
                  ),
                  TextFormField(
                    controller: _streetController,
                    decoration: const InputDecoration(labelText: "Street"),
                    validator: (value) => value!.isEmpty ? "Enter street" : null,
                  ),
                  TextFormField(
                    controller: _cityController,
                    decoration: const InputDecoration(labelText: "City"),
                    validator: (value) => value!.isEmpty ? "Enter city" : null,
                  ),
                  TextFormField(
                    controller: _stateController,
                    decoration: const InputDecoration(labelText: "State"),
                    validator: (value) =>
                    value!.isEmpty ? "Enter state" : null,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final address = {
                          "phone": _phoneController.text,
                          "street": _streetController.text,
                          "city": _cityController.text,
                          "state": _stateController.text,
                        };
                        saveAddress(address); // Save the address
                        onAddressSubmitted(address);
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: const Text(
                      "Confirm Order",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Stream<List<Map<String, dynamic>>> fetchSavedAddresses() async* {
  final addresses = await FirebaseFirestore.instance
      .collection('addresses')
      .get()
      .then((query) => query.docs.map((doc) => doc.data()).toList());
  yield addresses;
}


void saveAddress(Map<String, dynamic> address) {
  final userId = FirebaseAuth.instance.currentUser?.uid; // Assuming user authentication
  if (userId != null) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('addresses')
        .add(address);
  }
}