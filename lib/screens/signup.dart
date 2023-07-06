import 'package:gov_track_sa/utilities/show_snack_bar.dart';
import 'package:gov_track_sa/widgets/signup_login/custom_page.dart';
import '../utilities/enums.dart';
import '../utilities/helper_variables.dart';
import 'screen_barrel.dart';
import '../widgets/signup_login/custom_widgets.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    changeAppColors(context);
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;

    return SignupLoginCustomPage(
      addMap: true,
      onPressed: () {},
      buttonType: ButtonType.none,
      childWidget: Column(
        children: [
          //Email option
          GestureDetector(
            onTap: () {
              lastSignUpScreen = emailsignup;
              Navigator.pushNamed(context, emailsignup);
            },
            child: const SignupOptionButton(
              text: "Email",
              widget: SignupOptionIcon(icon: Icons.email_rounded),
            ),
          ),
          SizedBox(
            height: proportionalHeight(screenHeight, 12),
          ),

          //Phone option
          GestureDetector(
            onTap: () {
              //lastSignUpScreen = phonesignup;
              //Navigator.pushNamed(context, phonesignup);
              showSnackBar(
                  "Sorry, this feature is currently under "
                  "development and will be available in a future update.",
                  context);
            },
            child: const SignupOptionButton(
              text: "Phone",
              widget: SignupOptionIcon(icon: Icons.phone_rounded),
            ),
          ),
          SizedBox(
            height: proportionalHeight(screenHeight, 12),
          ),

          //Other options
          GestureDetector(
            onTap: () => showSnackBar(
                "Sorry, this feature is currently under "
                "development and will be available in a future update.",
                context),
            child: const SignupOptionButton(
              text: "Other Options",
              widget: SignupOptionIcon(icon: Icons.more_vert_rounded),
            ),
          ),
          SizedBox(
            height: proportionalHeight(screenHeight, 35),
          ),
        ],
      ),
    );
  }
}
