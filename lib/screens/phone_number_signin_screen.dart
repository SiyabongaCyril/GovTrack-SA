import '../utilities/controllers.dart';
import '../widgets/signup_login_custom_widgets.dart';
import '/widgets/signup_login_sample_page.dart';
import 'screen_barrel.dart';

class PhoneSignupScreen extends StatefulWidget {
  const PhoneSignupScreen({super.key});

  @override
  State<PhoneSignupScreen> createState() => _PhoneSignupScreenState();
}

class _PhoneSignupScreenState extends State<PhoneSignupScreen> {
  @override
  void initState() {
    AppControllers.phoneNameController = TextEditingController();
    AppControllers.phoneController = TextEditingController();
    AppControllers.phonePasswordController = TextEditingController();
    AppControllers.phoneConfirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    AppControllers.phoneNameController.dispose();
    AppControllers.phoneController.dispose();
    AppControllers.phonePasswordController.dispose();
    AppControllers.phoneConfirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    changeAppColors(context);
    return SignupLoginSamplePage(
      onPressed: () {},
      buttonType: ButtonType.signup,
      addMap: false,
      childWidget: Column(
        //Define textfields for phone signup screen
        children: [
          //full name
          SignupLoginTextField(
            headingText: "Full Name:",
            hintText: "* Enter your full name",
            textFieldController: AppControllers.phoneNameController,
          ),
          //phone number
          SignupLoginTextField(
            headingText: "Phone Number:",
            hintText: "* Enter your phone number",
            textFieldController: AppControllers.phoneController,
          ),
          //password
          SignupLoginTextField(
            headingText: "Password:",
            hintText: "* Enter your password",
            textFieldController: AppControllers.phonePasswordController,
          ),
          //confirm password
          SignupLoginTextField(
            headingText: "Confirm Password:",
            hintText: "* Confirm your password",
            textFieldController: AppControllers.phoneConfirmPasswordController,
          ),
        ],
      ),
    );
  }
}
