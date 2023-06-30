import 'package:gov_track_sa/widgets/signup_custom_widgets.dart';
import 'package:gov_track_sa/widgets/signup_login_sample_page.dart';
import '../utilities/controllers.dart';
import 'screen_barrel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    AppControllers.loginUsernameController = TextEditingController();
    AppControllers.loginPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    AppControllers.loginUsernameController.dispose();
    AppControllers.loginPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SignupLoginSamplePage(
      onPressed: () {},
      buttonType: ButtonType.login,
      childWidget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // Define Login text fields
        children: [
          // Username
          SignupLoginTextField(
            hintText: "Enter your username",
            headingText: "Username (phone or email):",
            textFieldController: AppControllers.loginUsernameController,
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
