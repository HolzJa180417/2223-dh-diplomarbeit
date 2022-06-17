//export class for the whole home page, will import widgets
import 'package:flutter/material.dart';

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Security App"),
        centerTitle: true,
      ),
      body: Container(child: Text("Security")),
    );
  }
}
