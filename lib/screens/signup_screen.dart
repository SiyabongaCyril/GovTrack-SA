import 'package:flutter_svg/flutter_svg.dart';
import 'package:gov_track_sa/widgets/signup_login_sample_page.dart';
import 'screen_barrel.dart';
import '/widgets/signup_custom_widgets.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;

    return SignupLoginSamplePage(
      buttonType: ButtonType.none,
      childWidget: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, gmailsignup);
            },
            child: SignupOptionButton(
              text: "Gmail",
              widget: SvgPicture.asset(
                "assets/images/Google__G__Logo.svg",
              ),
            ),
          ),
          SizedBox(
            height: proportionalHeight(screenHeight, 12),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, phonesignup);
            },
            child: const SignupOptionButton(
              text: "Phone",
              widget: Icon(
                Icons.call_rounded,
              ),
            ),
          ),
          SizedBox(
            height: proportionalHeight(screenHeight, 12),
          ),
          const SignupOptionButton(
            text: "Other Options",
            widget: Icon(
              Icons.more_vert_rounded,
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
