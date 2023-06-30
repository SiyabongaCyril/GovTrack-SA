import 'package:flutter/material.dart';

// This class contains all the controllers for the textfields in the app
class AppControllers {
  // Controllers for the textfields in the email signup screen
  static TextEditingController emailEmailController = TextEditingController();
  static TextEditingController emailPasswordController =
      TextEditingController();
  static TextEditingController emailConfirmPasswordController =
      TextEditingController();

  // Controllers for the textfields in the phone signup screen
  static TextEditingController phoneController = TextEditingController();
  static TextEditingController phonePasswordController =
      TextEditingController();
  static TextEditingController phoneConfirmPasswordController =
      TextEditingController();
  static TextEditingController phoneNameController = TextEditingController();

  // Controllers for the textfields in the login screen
  static TextEditingController loginUsernameController =
      TextEditingController();
  static TextEditingController loginPasswordController =
      TextEditingController();

// Properties and methods to assist with
// saving the registration information upon signup
// and navigating to the login screen

  static String _loginUsername = "";
  static String _loginPassword = "";

  static void setLoginTextFields(String username, String password) {
    _loginUsername = username;
    _loginPassword = password;
  }

  static void getLoginTextFields() {
    AppControllers.loginUsernameController.text = _loginUsername;
    AppControllers.loginPasswordController.text = _loginPassword;
  }
}
