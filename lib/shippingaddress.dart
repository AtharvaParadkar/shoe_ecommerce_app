import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class ShippingAddressPage extends StatefulWidget {
  const ShippingAddressPage({super.key});

  @override
  State<ShippingAddressPage> createState() => _ShippingAddressPageState();
}

class _ShippingAddressPageState extends State<ShippingAddressPage> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _pincodeController = TextEditingController();
  bool _isAddressSaved = false;

  Future<void> _saveAddress() async {
    if (_formKey.currentState!.validate()) {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final addressRef = FirebaseFirestore.instance
            .collection('users')
            .doc(user.email)
            .collection('addresses')
            .doc('address');

        final addressExists = await addressRef.get().then((doc) => doc.exists);

        if (addressExists) {
          await addressRef.set({
            // Overwrite if it exists
            'address': _addressController.text,
            'city': _addressController.text,
            'state': _addressController.text,
            'pincode': _addressController.text,
          });
        } else {
          await addressRef.set({
            'address': _addressController.text,
            'city': _addressController.text,
            'state': _addressController.text,
            'pincode': _addressController.text,
          });
        }
        setState(() {
          _isAddressSaved = true;
        });
        // ignore: use_build_context_synchronously
        Navigator.pop(context); // Return to the profile page
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadAddress();
  }

  Future<void> _loadAddress() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.email)
          .collection('addresses')
          .limit(1)
          .get();
      if (snapshot.docs.isNotEmpty) {
        final addressData = snapshot.docs.first.data();
        _addressController.text = addressData['address'];
        _cityController.text = addressData['city'];
        _stateController.text = addressData['state'];
        _pincodeController.text = addressData['pincode'];
        setState(() {
          _isAddressSaved = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Shipping Address')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blueAccent,
                Colors.lightBlueAccent,
              ]),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  if (_isAddressSaved) ...[
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Address: ${_addressController.text}'),
                              Text('City: ${_cityController.text}'),
                              Text('State: ${_stateController.text}'),
                              Text('Pincode: ${_pincodeController.text}'),
                            ]),
                      ),
                    )
                  ] else ...[
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        filled: true,
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Address is required';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _cityController,
                      decoration: InputDecoration(
                        labelText: 'City',
                        filled: true,
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'City is required';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _stateController,
                      decoration: InputDecoration(
                        labelText: 'State',
                        filled: true,
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'State is required';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _pincodeController,
                      decoration: InputDecoration(
                        labelText: 'Pincode',
                        filled: true,
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Pincode is required';
                        } else if (!RegExp(r'^[1-9][0-9]{5}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid Indian pincode';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: _saveAddress,
                      child: const Text('Save Address'),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
