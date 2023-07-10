import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gov_track_sa/services/auth/govtracksa_auth.dart';
import 'package:gov_track_sa/widgets/signup_login/custom_widgets.dart';
import 'package:gov_track_sa/widgets/signup_login/custom_page.dart';
import '../utilities/controllers.dart';
import '../utilities/enums.dart';
import '../utilities/helper_variables.dart';
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
  bool isEmailVerificationSent = false;
  bool isPasswordHidden = true;

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
  void changeCircularProgressIndicatorState(bool state) {
    setState(() {
      showCircularProgressIndicator = state;
    });
  }

  void isEMailVerificationSent(bool state) {
    setState(() {
      isEmailVerificationSent = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    checkEMailValidity();

    return SignupLoginCustomPage(
      showButtonCircularProgressIndicator: showCircularProgressIndicator,
      onPressed: () async {
        isEMailVerificationSent(false);
        try {
          // error checking
          if (AppControllers.loginUsernameController.text.isEmpty ||
              AppControllers.loginPasswordController.text.isEmpty) {
            showSnackBar("Please fill in all the required fields.", context);
            return;
          } else if (checkEMailUponLogin() == false) {
            showSnackBar("Please enter a valid email.", context);
            return;
          } else {
            changeCircularProgressIndicatorState(true);
            await AppAuth.auth
                .logIn(
              email: AppControllers.loginUsernameController.text,
              password: AppControllers.loginPasswordController.text,
              context: context,
            )
                .then((value) async {
              if (AppAuth.auth.currentUser?.isEmailVerified == true) {
                changeCircularProgressIndicatorState(false);
                lastSignUpScreen = signup;
                currentSignupPage = login;
                navigatePushNamedAndRemoveUntil(context, mainui);
              } else {
                log("Sending email verification to ${FirebaseAuth.instance.currentUser}");
                await AppAuth.auth.sendEmailVerification(context: context).then(
                  (value) async {
                    await AppAuth.auth.logOut(context: context).then(
                          (value) =>
                              changeCircularProgressIndicatorState(false),
                        );
                    isEMailVerificationSent(true);
                  },
                );
              }
            });
          }
        } catch (e) {
          if (AppAuth.auth.currentUser != null) {
            await AppAuth.auth.logOut(context: context);
          } // if user is sending an email verification after sending one:
          if (e.toString() ==
              "[firebase_auth/too-many-requests] We have"
                  " blocked all requests from this device due to unusual activity."
                  " Try again later.") {
            isEMailVerificationSent(true);
          }
          changeCircularProgressIndicatorState(false);
        }
      },
      buttonType: ButtonType.login,
      childWidget: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        // Define Login text fields
        children: [
          // if email verification is sent show text
          if (isEmailVerificationSent == true)
            Column(
              children: const [
                Text(
                  textAlign: TextAlign.justify,
                  "You need to verify your email before logging in."
                  " An email verification link has been sent to your email address."
                  " Please check your inbox or spam folder,"
                  " follow the instructions and try again.",
                  style: TextStyle(
                    color: orange,
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),

          // Username
          SignupLoginTextField(
            // keyboardType: TextInputType.emailAddress,
            onTextFieldChanged: (checkEmailValidity) => checkEMailValidity(),
            hintText: "Enter your username (phone or email)",
            headingText: "Username:",
            textFieldController: AppControllers.loginUsernameController,
            suffixWidget: isEmailValid
                ? const Icon(
                    Icons.check_circle_outline_rounded,
                    color: orange,
                    size: 18,
                  )
                : null,
          ),

          // Password
          SignupLoginTextField(
            hintText: "Enter your password",
            headingText: "Password:",
            textFieldController: AppControllers.loginPasswordController,
            suffixWidget: IconButton(
              onPressed: () {
                setState(() {
                  isPasswordHidden = !isPasswordHidden;
                });
              },
              icon: isPasswordHidden
                  ? const Icon(
                      Icons.visibility_off_rounded,
                      color: orange,
                      size: 18,
                    )
                  : const Icon(
                      Icons.visibility_rounded,
                      color: orange,
                      size: 18,
                    ),
              padding: EdgeInsets.zero,
            ),
            obscureText: isPasswordHidden,
          ),

          // Forgot password
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              child: const Text(
                "Forgot password?",
                style: TextStyle(
                    color: navyBlue,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal),
              ),
              onPressed: () {
                currentSignupPage = signup;
                navigateAndPushNamed(context, forgotpassword);
              },
            ),
          ),
        ],
      ),
    );
  }
}
