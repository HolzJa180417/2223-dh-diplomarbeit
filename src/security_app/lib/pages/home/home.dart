//export class for the whole home page, will import widgets
import 'package:flutter/material.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Security App"),
        centerTitle: true,
      ),
      body: const Text("Security"),
    );
  }
}
