import 'package:flutter/material.dart';
import 'package:security_app/pages/login/log_in_screen.dart';
import 'package:security_app/pages/sign_up/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Security App',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => Column(
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LogInScreen()));
                  },
                  heroTag: "btnLogIn",
                  child: const Text("Log-in"),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  heroTag: "btnRegister",
                  child: const Text("Register"),
                )
              ],
            ),
      },
    );
  }
}
