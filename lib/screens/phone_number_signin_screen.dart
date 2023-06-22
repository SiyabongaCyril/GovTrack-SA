import '/widgets/signup_custom_widgets.dart';
import '/widgets/signup_login_sample_page.dart';
import 'screen_barrel.dart';

class PhoneSignupScreen extends StatelessWidget {
  const PhoneSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SignupLoginSamplePage(
      addMap: false,
      buttonType: ButtonType.signup,
      childWidget: Column(
        children: const [
          //Enter full name
          SignupLoginTextField(
            headingText: "Full Name:",
            hintText: "Enter your full name",
          ),
          SignupLoginTextField(
            headingText: "Phone Number:",
            hintText: "Enter your phone number",
          ),
          SignupLoginTextField(
            headingText: "Password:",
            hintText: "Enter your password",
          ),
          SignupLoginTextField(
            headingText: "Confirm Password:",
            hintText: "Confirm your password",
          ),
        ],
      ),
    );
  }
}
