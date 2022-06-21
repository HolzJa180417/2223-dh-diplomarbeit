import 'package:http/http.dart' as http;
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

  Future<String> startRegister() async {
    var phpScript = "http://192.168.122.174/authentication/register.php";

    var response = await http.post(Uri.parse(phpScript), body: {
      'email': email,
      'password': password,
      'yearOfBirth': age,
      'firstName': firstName,
      'lastName': lastName,
      'code': code,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'hasPhoto': "1"
    });

    if (response.statusCode == 200 && response.body == "success") {
      createDatabaseObject(firstName, lastName, age, password, email, gender,
          phoneNumber, hasPhoto, code);
      return response.body;
    } else {
      return response.body;
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
