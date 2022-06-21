import 'package:flutter/material.dart';

class ErrorInfo extends StatelessWidget {
  final String errorString;
  const ErrorInfo({Key? key, required this.errorString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
          child: Column(
            children: [
              const Text("Fehler beim Registrieren!"),
              Container(
                width: 360,
                height: 230,
                color: Colors.grey,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    errorString,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
