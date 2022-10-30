import 'package:flutter/material.dart';

class WelocomePage extends StatelessWidget {
  const WelocomePage(
      {super.key,
      required this.name,
      required this.email,
      required this.password,
      required this.phonenumber});
  final String name;
  final String email;
  final String password;
  final String phonenumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(name),
          const SizedBox(
            height: 20,
          ),
          Text(email),
          const SizedBox(
            height: 20,
          ),
          Text(password),
          const SizedBox(
            height: 20,
          ),
          Text(phonenumber)
        ],
      ),
    );
  }
}
