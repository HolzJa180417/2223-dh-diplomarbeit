import 'package:flutter/material.dart';
import 'package:security_app/domain/authentication/login_manager.dart';
import 'package:security_app/pages/home/home.dart';
import 'package:security_app/pages/sign_up/view/failed_splash.dart';
import 'package:security_app/pages/sign_up/widgets/text_box.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextBox emailBox =
      TextBox(label: "Email", textInputType: TextInputType.emailAddress);
  TextBox passwordBox =
      TextBox(label: "Passwort", textInputType: TextInputType.visiblePassword);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log-in"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          emailBox,
          passwordBox,
          FloatingActionButton(onPressed: () {
            String response = "";
            var lManager = LoginManager(
                email: emailBox.controller.text,
                password: passwordBox.controller.text);
            lManager.startLogin().then((String value) {
              setState(() {
                response = value;
              });
              if (response == "success") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomeScreen()));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FailedSplashScreen(
                              errorString: response,
                              operation: "Fehlber beim LogIn",
                            )));
              }
            });
          }),
        ],
      ),
    );
  }
}
