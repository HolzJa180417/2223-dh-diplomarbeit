//splash screen if registration was not sucessful
import 'package:flutter/material.dart';
import 'package:security_app/pages/sign_up/widgets/error_information.dart';

class FailedSplashScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String age;
  final String email;
  final String phoneNumber;
  final String password;
  final String code;
  final String gender;
  final String errorString;

  const FailedSplashScreen(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.age,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.code,
      required this.gender,
      required this.errorString})
      : super(key: key);

  @override
  State<FailedSplashScreen> createState() => FailedSplashScreenState();
}

// ignore: camel_case_types
class FailedSplashScreenState extends State<FailedSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Failure!"),
        ),
        body: ErrorInfo(errorString: widget.errorString));
  }
}
