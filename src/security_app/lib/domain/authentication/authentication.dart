//combined file of email + password
import 'package:security_app/domain/authentication/email.dart';
import 'package:security_app/domain/authentication/password.dart';
import 'package:security_app/exceptions/custom_exception.dart';

class AuthenticationManager {
  final CheckPassword checkPassword;
  final CheckEmail checkEmail;
  AuthenticationManager(
      {required this.checkPassword, required this.checkEmail});

  //checks if the authentication is valid
  bool checkIfAuthenticationDataIsValied() {
    if (checkEmail.checkIfEmailIsValied()) {
      if (checkPassword.checkIfPasswordIsValid()) {
        return true;
      } else {
        throw CustomException(
            "Your password is not valid! Please try again or reset your password!");
      }
    } else {
      throw CustomException(
          "Your E-Mail is not valid! Please try again or regiser!");
    }
  }
}
