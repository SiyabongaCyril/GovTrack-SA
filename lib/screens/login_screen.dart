import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:gov_track_sa/services/auth/govtracksa_auth.dart';
import 'package:gov_track_sa/widgets/signup_custom_widgets.dart';
import 'package:gov_track_sa/widgets/signup_login_sample_page.dart';
import '../utilities/controllers.dart';
import '../utilities/show_snack_bar.dart';
import 'screen_barrel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // This variable is used to check if the email entered is valid
  bool isEmailValid = false;
  bool isEmailValidUponLogin = true;
  bool showCircularProgressIndicator = false;

  @override
  void initState() {
    AppControllers.loginUsernameController = TextEditingController();
    AppControllers.loginPasswordController = TextEditingController();
    AppControllers.getLoginTextFields();
    super.initState();
  }

  @override
  void dispose() {
    AppControllers.loginUsernameController.dispose();
    AppControllers.loginPasswordController.dispose();
    super.dispose();
  }

// This function is used to check if the email entered is valid
  void checkEMailValidity() {
    log("Checking email validity");
    setState(() {
      isEmailValid = EmailValidator.validate(
          AppControllers.loginUsernameController.text, true, true);
      if (isEmailValid == true && isEmailValidUponLogin == false) {
        isEmailValidUponLogin = true;
      }
    });
  }

  // Check if fields are empty
  void checkEmptyFields(TextEditingController controller, String text) {
    setState(
      () {
        if (controller.text.isEmpty) {
          showSnackBar(text, context);
        }
      },
    );
  }

  // Check if email is valid when login button is pressed
  bool checkEMailUponLogin() {
    setState(() {
      isEmailValid
          ? isEmailValidUponLogin = true
          : isEmailValidUponLogin = false;
    });
    return isEmailValidUponLogin;
  }

  // change the state of the circular progress indicator
  void changeCircularProgressIndicatorState() {
    setState(() {
      showCircularProgressIndicator = !showCircularProgressIndicator;
    });
  }

  @override
  Widget build(BuildContext context) {
    checkEMailValidity();
    return SignupLoginSamplePage(
      showCircularProgressIndicator: showCircularProgressIndicator,
      onPressed: () async {
        try {
          // error checking

          if (checkEMailUponLogin() == false) {
            showSnackBar("Please enter a valid email.", context);
            return;
          }
          if (AppControllers.loginUsernameController.text.isEmpty ||
              AppControllers.loginPasswordController.text.isEmpty) {
            showSnackBar("Please fill in all the required fields.", context);
            return;
          } else {
            changeCircularProgressIndicatorState();
            log("Trying to login user");
            await AppAuth.auth
                .logIn(
              email: AppControllers.loginUsernameController.text,
              password: AppControllers.loginPasswordController.text,
              context: context,
            )
                .then((value) {
              log("Login successful");
              changeCircularProgressIndicatorState();
              navigatePushNamedAndRemoveUntil(context, mainui);
            });
          }
        } catch (e) {
          log("Login failed");
          changeCircularProgressIndicatorState();
        }
      },
      buttonType: ButtonType.login,
      childWidget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // Define Login text fields
        children: [
          // Username
          SignupLoginTextField(
            // keyboardType: TextInputType.emailAddress,
            onTextFieldChanged: (checkEmailValidity) => checkEMailValidity(),
            hintText: "Enter your username",
            headingText: "Username (phone or email):",
            textFieldController: AppControllers.loginUsernameController,
            suffixWidget: isEmailValid
                ? const Icon(
                    Icons.check_circle,
                    color: orange,
                  )
                : null,
          ),
          // Password
          SignupLoginTextField(
            hintText: "Enter your password",
            headingText: "Password:",
            textFieldController: AppControllers.loginPasswordController,
          ),
        ],
      ),
    );
  }
}
