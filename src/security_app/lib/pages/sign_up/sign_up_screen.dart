import 'package:flutter/material.dart';
import 'package:security_app/domain/authentication/registration_manager.dart';
import 'package:security_app/pages/sign_up/view/failed_splash.dart';
import 'package:security_app/pages/sign_up/view/sucessful_splash.dart';
import 'package:security_app/pages/sign_up/widgets/text_box.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextBox fNameBox =
      TextBox(label: "Vorname", textInputType: TextInputType.name);
  TextBox lNameBox =
      TextBox(label: "Nachname", textInputType: TextInputType.name);
  TextBox ageBox =
      TextBox(label: "Geburtsjahr", textInputType: TextInputType.number);
  TextBox pBox =
      TextBox(label: "Passwort", textInputType: TextInputType.visiblePassword);
  TextBox emailBox =
      TextBox(label: "E-Mail", textInputType: TextInputType.emailAddress);
  TextBox codeBox = TextBox(
      label: "Code (falls vorhanden)", textInputType: TextInputType.number);
  TextBox phoneBox =
      TextBox(label: "Telefonnummer", textInputType: TextInputType.phone);
  TextBox genderBox =
      TextBox(label: "Geschlecht", textInputType: TextInputType.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign-Up"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            fNameBox,
            lNameBox,
            ageBox,
            pBox,
            emailBox,
            codeBox,
            phoneBox,
            genderBox,
            FloatingActionButton(
              onPressed: () {
                var rManager = RegistrationManager(
                    firstName: fNameBox.controller.text,
                    lastName: lNameBox.controller.text,
                    age: ageBox.controller.text,
                    email: emailBox.controller.text,
                    code: codeBox.controller.text,
                    password: pBox.controller.text,
                    phoneNumber: phoneBox.controller.text,
                    hasPhoto: "1",
                    gender: genderBox.controller.text);
                String response = "";
                rManager.startRegister().then((String value) {
                  setState(() {
                    response = value;
                  });
                  if (response == "success") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccesSplashScreen(
                                firstName: fNameBox.controller.text,
                                lastName: lNameBox.controller.text,
                                age: ageBox.controller.text,
                                email: emailBox.controller.text,
                                phoneNumber: phoneBox.controller.text,
                                password: pBox.controller.text,
                                code: codeBox.controller.text,
                                gender: genderBox.controller.text)));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FailedSplashScreen(
                                  errorString: response,
                                  operation: "Fehler beim Registrieren",
                                )));
                  }
                });
              },
            ),
          ],
        ));
  }
}
