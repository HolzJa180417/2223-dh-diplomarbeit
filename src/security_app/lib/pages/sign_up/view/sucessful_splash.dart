//splash screen if registration was sucessful
import 'package:flutter/material.dart';

class SuccesSplashScreen extends StatefulWidget {
  const SuccesSplashScreen({Key? key});

  @override
  State<SuccesSplashScreen> createState() => Succes_SplashScreenState();
}

class Succes_SplashScreenState extends State<SuccesSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Success!"),
      ),
      body: Column(
        children: [Text("Herlichen Glückwunsch!")],
      ),
    );
  }
}
