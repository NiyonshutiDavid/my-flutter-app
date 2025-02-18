import 'package:flutter/material.dart';
import 'screen2.dart';
import '../input_field.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  // Validate that the name is not empty
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  // Validate that the email has a correct format
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Regular expression for validating an email address
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Validate that the phone number consists of exactly 10 digits
  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    // Regular expression for validating a 10-digit phone number
    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  }

  void _navigateToScreen2() {
    // Check if the form is valid before navigating
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Screen2(
            name: _nameController.text,
            email: _emailController.text,
            phone: _phoneController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Welcome To Our App'),),
        backgroundColor: const Color.fromARGB(255, 210, 228, 243),
      ),
      body:  
      Container(
        color: const Color.fromARGB(255, 201, 234, 220),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Input your details to be displayed into next screen",
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
                InputField(
                  controller: _nameController,
                  labelText: 'Name',
                  validator: _validateName,
                ),
                const SizedBox(height: 16),
                InputField(
                  controller: _emailController,
                  labelText: 'Email',
                  validator: _validateEmail,
                ),
                const SizedBox(height: 16),
                InputField(
                  controller: _phoneController,
                  labelText: 'Phone Number',
                  validator: _validatePhone,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _navigateToScreen2,
                  child: const Text('Display'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
