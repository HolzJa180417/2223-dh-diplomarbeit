import 'package:http/http.dart' as http;

class LoginManager {
  final String email;
  final String password;
  LoginManager({required this.email, required this.password});

  Future<String> startLogin() async {
    String phpScript = "http://192.168.122.174/authentication/login.php";

    var response = await http.post(Uri.parse(phpScript),
        body: {'email': email, 'password': password});

    return response.body;
  }
}
