import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  const Screen2({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Output')),
        backgroundColor: const Color.fromARGB(255, 210, 228, 243),
      ),
      body: Center( // Centers the container
        child: Container(
          width: 300, // Adjust the width as needed
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 201, 234, 220),
            borderRadius: BorderRadius.circular(20), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Makes the column only as big as its children
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: $name', style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text('Email: $email', style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text('Phone: $phone', style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
