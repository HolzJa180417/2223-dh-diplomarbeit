import 'package:flutter/material.dart';

//Custom TextBox Widget with nice theming
//pass the label, the textInputType and if you want a key via the constructor
//you can then get the text from the text box with object.getInput() Method!
class TextBox extends StatelessWidget {
  final String label;
  final TextInputType textInputType;
  TextBox({Key? key, required this.label, required this.textInputType})
      : super(key: key);
  final TextEditingController controller = TextEditingController();

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  TextEditingController getController() {
    return controller;
  }

  String getInput() {
    return controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: "$label:",
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(),
            ),
            //fillColor: Colors.green
          ),
          validator: (val) {
            if (val == null) {
              return null;
            } else {
              if (val.isEmpty) {
                return "$label cannot be empty!";
              } else {
                return null;
              }
            }
          },
          keyboardType: textInputType,
          style: const TextStyle(
            fontFamily: "Poppins",
          ),
          controller: controller,
        ),
      ),
    );
  }
}
