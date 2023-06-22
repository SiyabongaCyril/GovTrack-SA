import 'package:gov_track_sa/widgets/signup_custom_widgets.dart';
import 'package:gov_track_sa/widgets/signup_login_sample_page.dart';
import 'screen_barrel.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SignupLoginSamplePage(
      childWidget:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: const [
        SignupLoginTextField(
            hintText: "Enter your username", headingText: "Username:"),
        SignupLoginTextField(
          hintText: "Enter your password",
          headingText: "Password:",
        ),
      ]),
      buttonType: ButtonType.login,
    );
  }
}
