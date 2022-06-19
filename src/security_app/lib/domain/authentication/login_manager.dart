import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:security_app/exceptions/custom_exception.dart';

class LoginManager {
  final String email;
  final String password;
  LoginManager({required this.email, required this.password});

  startLogin() async {
    String apiurl =
        "http://192.168.178.50/authentication/check_if_mail_and_password_are_valid.php"; //api url
    //dont use http://localhost , because emulator don't get that address
    //insted use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP

    var response = await http.post(Uri.parse(apiurl), body: {
      'email': email, //get the email text
      'password': password //get password text
    });

    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      if (jsondata["error"]) {
        throw CustomException("Die E-Mail oder das Passwort sind falsch!");
      } else {
        if (jsondata["success"]) {
        } else {
          throw CustomException("Es ist etwas schiefgelafuen beim LogIn.");
        }
      }
    } else {
      throw CustomException("Keine Verbindung zum Server!");
    }
  }
}
