import 'package:flutter/material.dart';
import 'package:security_app/pages/sign_up/sign_up.dart';

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
        '/': (context) => const SignUp(),
      },
    );
  }
}
