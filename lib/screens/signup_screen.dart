//import 'package:flutter_svg/flutter_svg.dart';
import 'package:gov_track_sa/widgets/signup_login_sample_page.dart';
import 'screen_barrel.dart';
import '../widgets/signup_login_custom_widgets.dart';

// Tracks the last signup screen visited inorder to return to it from login screen
String lastSignUpScreen = signup;

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    changeAppColors(context);
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;

    return SignupLoginSamplePage(
      onPressed: () {},
      buttonType: ButtonType.none,
      childWidget: Column(
        //Define textfields for main signup screen
        children: [
          //Email option
          GestureDetector(
            onTap: () {
              lastSignUpScreen = emailsignup;
              Navigator.pushNamed(context, emailsignup);
            },
            child: const SignupOptionButton(
              text: "Email",
              widget: /*SvgPicture.asset(
                "assets/images/Google__G__Logo.svg",
              )*/
                  Icon(
                Icons.email_rounded,
                color: black,
                size: 20,
                shadows: [
                  Shadow(
                    color: black,
                    blurRadius: 2,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: proportionalHeight(screenHeight, 12),
          ),
          //Phone option
          GestureDetector(
            onTap: () {
              lastSignUpScreen = phonesignup;
              Navigator.pushNamed(context, phonesignup);
            },
            child: const SignupOptionButton(
              text: "Phone",
              widget: Icon(
                Icons.call_rounded,
                color: black,
                size: 20,
                shadows: [
                  Shadow(
                    color: black,
                    blurRadius: 2,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: proportionalHeight(screenHeight, 12),
          ),
          //Other options
          const SignupOptionButton(
            text: "Other Options",
            widget: Icon(
              size: 20,
              Icons.more_vert_rounded,
              color: black,
              shadows: [
                Shadow(
                  color: black,
                  blurRadius: 2,
                  offset: Offset(0, 0),
                ),
              ],
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
