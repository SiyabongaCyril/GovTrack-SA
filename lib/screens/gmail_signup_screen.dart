import 'package:gov_track_sa/widgets/signup_custom_widgets.dart';
import 'package:gov_track_sa/widgets/signup_login_sample_page.dart';
import 'screen_barrel.dart';

class GmailSignupScreen extends StatelessWidget {
  const GmailSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SignupLoginSamplePage(
        buttonType: ButtonType.signup,
        childWidget: Column(
          children: const [
            SignupLoginTextField(
                headingText: "Email:", hintText: "Enter your email"),
            SignupLoginTextField(
                headingText: "Password:", hintText: "Enter your password"),
            SignupLoginTextField(
                headingText: "Confirm Password:",
                hintText: "Confirm your password"),
          ],
        ));
  }
}
