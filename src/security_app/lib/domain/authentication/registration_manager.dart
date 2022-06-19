import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:security_app/exceptions/custom_exception.dart';
import 'package:security_app/models/person.dart';

class RegistrationManager {
  final String firstName;
  final String lastName;
  final String age;
  final String email;
  final String phoneNumber;
  final String password;
  final String code;
  final String hasPhoto;
  final String gender;

  RegistrationManager(
      {required this.firstName,
      required this.lastName,
      required this.age,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.code,
      required this.gender,
      required this.hasPhoto});

  startRegister() async {
    String apiurl =
        "http://192.168.178.50/authentication/register.php"; //api url
    //dont use http://localhost , because emulator don't get that address
    //insted use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP

    var response = await http.post(Uri.parse(apiurl), body: {
      'email': email, //get the email text
      'password': password, //get password text
      'yearOfBirth': age,
      'firstName': firstName,
      'lastName': lastName,
      'code': code,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'hasPhoto': 1
    });

    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      if (jsondata["error"]) {
        throw CustomException("Die E-Mail oder das Passwort sind falsch!");
      } else {
        if (!jsondata["success"]) {
          throw CustomException(
              "Es ist etwas schiefgelafuen beim Registrieren.");
        } else {
          createDatabaseObject(firstName, lastName, age, password, email,
              gender, phoneNumber, hasPhoto, code);
        }
      }
    } else {
      throw CustomException("Keine Verbindung zum Server!");
    }
  }
}

Person createDatabaseObject(
    String firstName,
    String lastName,
    String age,
    String password,
    String email,
    String gender,
    String phoneNumber,
    String hasPhoto,
    String code) {
  return Person(
      firstName: firstName,
      lastName: lastName,
      age: age,
      email: email,
      password: password,
      gender: gender,
      hasPhoto: hasPhoto,
      phoneNumber: phoneNumber,
      code: code);
}
