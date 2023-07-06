import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:gov_track_sa/screens/screen_barrel.dart';
import 'package:gov_track_sa/services/auth/govtracksa_auth.dart';
import 'package:gov_track_sa/utilities/controllers.dart';
import 'package:gov_track_sa/widgets/signup_login/custom_widgets.dart';
import 'package:gov_track_sa/widgets/signup_login/custom_page.dart';

import '../utilities/enums.dart';
import '../utilities/show_snack_bar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool linkSent = false;
  bool showCircularProgressIndicator = false;
  bool isEmailValid = false;
  bool isEmailValidUponSendingPasswordResetLink = true;

  @override
  void initState() {
    AppControllers.forgotPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    AppControllers.forgotPasswordController.dispose();
    super.dispose();
  }

  // change the state of the circular progress indicator
  void changeCircularProgressIndicatorState() {
    setState(() {
      showCircularProgressIndicator = !showCircularProgressIndicator;
    });
  }

  // This function is used to check if the email entered is valid
  void checkEMailValidity() {
    log("Checking email validity");
    setState(() {
      isEmailValid = EmailValidator.validate(
          AppControllers.forgotPasswordController.text, true, true);
      if (isEmailValid == true &&
          isEmailValidUponSendingPasswordResetLink == false) {
        isEmailValidUponSendingPasswordResetLink = true;
      }
    });
  }

  // Check if email is valid when login button is pressed
  bool checkEMailUponSendingPasswordResetLink() {
    setState(() {
      isEmailValid
          ? isEmailValidUponSendingPasswordResetLink = true
          : isEmailValidUponSendingPasswordResetLink = false;
    });
    return isEmailValidUponSendingPasswordResetLink;
  }

  @override
  Widget build(BuildContext context) {
    changeAppColors(context);
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;

    return StatusBarContainer(
      color: white,
      widget: Scaffold(
        body: SignupLoginCustomPage(
          showButtonCircularProgressIndicator: showCircularProgressIndicator,
          onPressed: () {},
          buttonType: ButtonType.none,
          childWidget: Column(
            children: [
              //did you forget your password? if not sign up or login above
              Text(
                "Did you forget your password? Reset it here. If not, choose"
                " to sign up or login above.",
                style: TextStyle(
                  fontSize: proportionalHeight(screenHeight, 13),
                  fontWeight: FontWeight.w300,
                  color: black,
                ),
              ),

              SizedBox(
                height: proportionalHeight(screenHeight, 5),
              ),

              //Password Reset Link Sent Text
              linkSent
                  ? Text(
                      "Password reset link sent to your email. Please check your inbox"
                      " , follow the instructions and login.",
                      style: TextStyle(
                        fontSize: proportionalHeight(screenHeight, 13),
                        fontWeight: FontWeight.w300,
                        color: orange,
                      ),
                    )
                  : const SizedBox(),

              SizedBox(
                height: proportionalHeight(screenHeight, 20),
              ),

              // Email Address or phone Text Field
              SignupLoginTextField(
                onTextFieldChanged: (checkEmailValidity) =>
                    checkEMailValidity(),
                headingText: "Username:",
                hintText: "Enter your username (phone or email)",
                textFieldController: AppControllers.forgotPasswordController,
                keyboardType: TextInputType.emailAddress,
                suffixWidget: isEmailValid
                    ? const Icon(
                        Icons.check_circle_outline_outlined,
                        color: orange,
                        size: 18,
                      )
                    : null,
              ),

              SizedBox(
                height: proportionalHeight(screenHeight, 20),
              ),

              // Request Password Link Button
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: proportionalWidth(screenWidth, 200),
                  height: proportionalHeight(screenHeight, 30),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    color: navyBlue,
                    boxShadow: [
                      BoxShadow(
                        color: black,
                        offset: Offset(-2, 3),
                        blurRadius: 1,
                      )
                    ],
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () async {
                        try {
                          if (AppControllers
                              .forgotPasswordController.text.isEmpty) {
                            showSnackBar(
                                "Please fill the required field.", context);
                            return;
                          } else if (checkEMailUponSendingPasswordResetLink() ==
                              false) {
                            showSnackBar(
                                "Please enter a valid email.", context);
                            return;
                          } else {
                            changeCircularProgressIndicatorState();
                            await AppAuth.auth
                                .sendPasswordResetEmail(
                              context: context,
                              email:
                                  AppControllers.forgotPasswordController.text,
                            )
                                .then(
                              (value) {
                                linkSent = true;
                                changeCircularProgressIndicatorState();
                              },
                            );
                          }
                        } catch (e) {
                          log("Sending password reset email failed: $e");
                          changeCircularProgressIndicatorState();
                        }
                      },
                      child: Text(
                        "Request password reset",
                        style: TextStyle(
                          color: white,
                          fontSize: proportionalHeight(screenHeight, 13),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
