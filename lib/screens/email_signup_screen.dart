import 'dart:developer';

import 'package:gov_track_sa/services/auth/govtracksa_auth.dart';
import 'package:gov_track_sa/utilities/show_snack_bar.dart';
import 'package:gov_track_sa/widgets/signup_custom_widgets.dart';
import 'package:gov_track_sa/widgets/signup_login_sample_page.dart';
import '../utilities/controllers.dart';
import 'screen_barrel.dart';
import 'package:email_validator/email_validator.dart';

class EmailSignupScreen extends StatefulWidget {
  const EmailSignupScreen({Key? key}) : super(key: key);

  @override
  State<EmailSignupScreen> createState() => _EmailSignupScreenState();
}

class _EmailSignupScreenState extends State<EmailSignupScreen> {
  // This variable is used to check if the email entered is valid
  bool isEmailValid = false;
  bool isEmailValidUponSignup = true;

  @override
  void initState() {
    AppControllers.emailEmailController = TextEditingController();
    AppControllers.emailPasswordController = TextEditingController();
    AppControllers.emailConfirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    AppControllers.emailEmailController.dispose();
    AppControllers.emailPasswordController.dispose();
    AppControllers.emailConfirmPasswordController.dispose();
    super.dispose();
  }

// This function is used to check if the email entered is valid
  void checkEMail() {
    setState(() {
      isEmailValid = EmailValidator.validate(
          AppControllers.emailEmailController.text, true, true);
      if (isEmailValid == true && isEmailValidUponSignup == false) {
        isEmailValidUponSignup = true;
      }
    });
  }

  void checkEmptyFields(TextEditingController controller, String text) {
    setState(
      () {
        if (controller.text.isEmpty) {
          showSnackBar(text, context);
        }
      },
    );
  }

  bool checkEMailUponSignup() {
    setState(() {
      isEmailValid
          ? isEmailValidUponSignup = true
          : isEmailValidUponSignup = false;
    });
    return isEmailValidUponSignup;
  }

  @override
  Widget build(BuildContext context) {
    return SignupLoginSamplePage(
      onPressed: () async {
        // error checking
        if (checkEMailUponSignup() == false) {
          showSnackBar("please enter a valid email", context);
          return;
        }
        if (AppControllers.emailEmailController.text.isEmpty ||
            AppControllers.emailPasswordController.text.isEmpty ||
            AppControllers.emailConfirmPasswordController.text.isEmpty) {
          showSnackBar("please fill in missing details", context);
          return;
        } else if (AppControllers.emailPasswordController.text !=
            AppControllers.emailConfirmPasswordController.text) {
          showSnackBar("passwords do not match", context);
          return;
        } else {
          log("Trying to register user");
          await AppAuth.auth
              .register(
                email: AppControllers.emailEmailController.text,
                password: AppControllers.emailPasswordController.text,
              )
              .then((value) => log("User registered successfully"));
        }
      },
      addMap: true,
      buttonType: ButtonType.signup,
      childWidget: Column(
        // All textfields for the gmail signup screen
        children: [
          // email
          SignupLoginTextField(
              onTextFieldChanged: (checkEmailValidity) => checkEMail(),
              headingText: "Email:",
              hintText: "* Enter your email",
              textFieldController: AppControllers.emailEmailController,
              suffixWidget: isEmailValid
                  ? const Icon(
                      Icons.check_circle,
                      color: orange,
                    )
                  : null),

          // password
          SignupLoginTextField(
            headingText: "Password:",
            hintText: "* Enter your password",
            textFieldController: AppControllers.emailPasswordController,
          ),
          //confirm password
          SignupLoginTextField(
            headingText: "Confirm Password:",
            hintText: "* Confirm your password",
            textFieldController: AppControllers.emailConfirmPasswordController,
          ),
        ],
      ),
    );
  }
}
