import 'package:flutter/material.dart';
import 'package:security_app/models/person.dart';
import 'package:security_app/pages/sign_up/view/sucessful_splash.dart';
import 'package:security_app/pages/sign_up/widgets/text_box.dart';

class Sign_up extends StatefulWidget {
  Sign_up({Key? key}) : super(key: key);

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  TextEditingController getController() {
    return TextEditingController();
  }

  late String firstName;
  late String lastName;
  late String email;
  late String age;
  late String phoneNumber;
  late String password;
  TextBox fNameBox =
      TextBox(label: "Vorname", textInputType: TextInputType.name);
  TextBox lNameBox =
      TextBox(label: "Nachname", textInputType: TextInputType.name);
  TextBox ageBox =
      TextBox(label: "Geburtsjahr", textInputType: TextInputType.number);
  TextBox pBox =
      TextBox(label: "Passwort", textInputType: TextInputType.visiblePassword);
  TextBox pbBox = TextBox(
      label: "Passwort bestätigen",
      textInputType: TextInputType.visiblePassword);
  TextBox emailBox =
      TextBox(label: "E-Mail", textInputType: TextInputType.emailAddress);
  //TextBox codeBox = TextBox(
  //label: "Code (falls vorhanden)", textInputType: TextInputType.number);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign-Up"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            fNameBox,
            lNameBox,
            ageBox,
            pBox,
            pbBox,
            emailBox,
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SuccesSplashScreen()));
              },
            ),
          ],
        ));
  }
}

Person createDatabaseObject(
    String firstName, String lastName, int age, String password, String email) {
  return Person(
      firstName: firstName,
      lastName: lastName,
      age: age,
      email: email,
      password: password);
}
