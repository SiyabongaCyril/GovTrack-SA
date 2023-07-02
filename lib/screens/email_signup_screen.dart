import 'package:gov_track_sa/services/auth/govtracksa_auth.dart';
import 'package:gov_track_sa/utilities/show_snack_bar.dart';
import 'package:gov_track_sa/widgets/signup_login_custom_widgets.dart';
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
  bool showCircularProgressIndicator = false;

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
  void checkEMailValidity() {
    setState(() {
      isEmailValid = EmailValidator.validate(
          AppControllers.emailEmailController.text, true, true);
      if (isEmailValid == true && isEmailValidUponSignup == false) {
        isEmailValidUponSignup = true;
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

  // Check if email is valid when signup button is pressed
  bool checkEMailUponSignup() {
    setState(() {
      isEmailValid
          ? isEmailValidUponSignup = true
          : isEmailValidUponSignup = false;
    });
    return isEmailValidUponSignup;
  }

  void changeCircularProgressIndicatorStatus(bool status) {
    setState(() {
      showCircularProgressIndicator = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeAppColors(context);
    return SignupLoginSamplePage(
      showCircularProgressIndicator: showCircularProgressIndicator,
      onPressed: () async {
// error checking
        try {
          if (AppControllers.emailEmailController.text.isEmpty ||
              AppControllers.emailPasswordController.text.isEmpty ||
              AppControllers.emailConfirmPasswordController.text.isEmpty) {
            showSnackBar("Please fill in all the required fields.", context);
            return;
          } else if (checkEMailUponSignup() == false) {
            showSnackBar("Please enter a valid email.", context);
            return;
          } else if (AppControllers.emailPasswordController.text !=
              AppControllers.emailConfirmPasswordController.text) {
            showSnackBar("Passwords do not match.", context);
            return;
          } else {
            changeCircularProgressIndicatorStatus(true);
            await AppAuth.auth
                .register(
              email: AppControllers.emailEmailController.text,
              password: AppControllers.emailPasswordController.text,
              context: context,
            )
                .then(
              (value) async {
                await AppAuth.auth.logOut(context: context).then((value) {
                  AppControllers.setLoginTextFields(
                      AppControllers.emailEmailController.text,
                      AppControllers.emailPasswordController.text);
                  changeCircularProgressIndicatorStatus(false);
                  navigateAndPushNamed(context, login);
                });
              },
            );
          }
        } catch (e) {
          changeCircularProgressIndicatorStatus(false);
        }
      },
      addMap: true,
      buttonType: ButtonType.signup,
      childWidget: Column(
        // All textfields for the gmail signup screen
        children: [
          // email
          SignupLoginTextField(
              keyboardType: TextInputType.emailAddress,
              onTextFieldChanged: (checkEmailValidity) => checkEMailValidity(),
              headingText: "Email:",
              hintText: "* Enter your email",
              textFieldController: AppControllers.emailEmailController,
              suffixWidget: isEmailValid
                  ? const Icon(
                      Icons.check_circle_outline_outlined,
                      color: orange,
                      size: 18,
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
