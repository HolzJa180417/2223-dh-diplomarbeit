//splash screen if registration was sucessful
import 'package:flutter/material.dart';

class SuccesSplashScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String age;
  final String email;
  final String phoneNumber;
  final String password;
  final String code;
  final String gender;

  const SuccesSplashScreen(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.age,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.code,
      required this.gender})
      : super(key: key);

  @override
  State<SuccesSplashScreen> createState() => SuccesSplashScreenState();
}

// ignore: camel_case_types
class SuccesSplashScreenState extends State<SuccesSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Success!"),
      ),
      body: Column(
        children: const [Text("Herlichen Glückwunsch!")],
      ),
    );
  }
}
