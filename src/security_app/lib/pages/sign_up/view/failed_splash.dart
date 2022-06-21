//splash screen if registration was not sucessful
import 'package:flutter/material.dart';
import 'package:security_app/pages/sign_up/widgets/error_information.dart';

class FailedSplashScreen extends StatefulWidget {
  final String errorString;
  final String operation;

  const FailedSplashScreen(
      {Key? key, required this.errorString, required this.operation})
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
          title: Text(widget.operation),
        ),
        body: ErrorInfo(errorString: widget.errorString));
  }
}
