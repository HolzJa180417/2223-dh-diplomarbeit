import 'package:flutter/material.dart';

class Sign_up extends StatefulWidget {
  Sign_up({Key? key}) : super(key: key);

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  late String firstName;
  late String lastName;
  late String email;
  late String age;
  late String phoneNumber;
  late String password;
  TextEditingController tec = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign-Up"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const Text("Vorname:"),
          TextField(
            keyboardType: TextInputType.text,
            onChanged: (text) {
              if (text != firstName) {
                firstName = text;
              }
            },
          ),
          const Text("Nachname:"),
          TextField(
            keyboardType: TextInputType.text,
            onChanged: (text) {
              if (text != lastName) {
                lastName = text;
              }
            },
          ),
          const Text("Alter:"),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (text) {
              if (text != age) {
                age = text;
              }
            },
          ),
          const Text("E-Mail:"),
          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) {
              if (text != email) {
                email = text;
              }
            },
          ),
          const Text("Passwort:"),
          TextField(
            keyboardType: TextInputType.visiblePassword,
            onChanged: (text) {
              if (text != password) {
                password = text;
              }
            },
          ),
        ],
      ),
    );
  }
}
