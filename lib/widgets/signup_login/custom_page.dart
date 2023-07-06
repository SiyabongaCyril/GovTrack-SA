import 'package:gov_track_sa/screens/screen_barrel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utilities/enums.dart';
import '../../utilities/helper_variables.dart';
import 'custom_widgets.dart';

class SignupLoginCustomPage extends StatefulWidget {
  const SignupLoginCustomPage({
    super.key,
    required this.childWidget,
    this.buttonType = ButtonType.none,
    this.addMap = true,
    required this.onPressed,
    this.showButtonCircularProgressIndicator = false,
  });

  final Widget childWidget;
  final ButtonType buttonType;
  final void Function() onPressed;
  final bool addMap, showButtonCircularProgressIndicator;

  @override
  State<SignupLoginCustomPage> createState() => _SignupLoginCustomPageState();
}

class _SignupLoginCustomPageState extends State<SignupLoginCustomPage> {
  @override
  Widget build(BuildContext context) {
    changeAppColors(context);
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;

    return StatusBarContainer(
      color: white,
      widget: WillPopScope(
        // This is used to change the page when the back button is pressed
        onWillPop: () async {
          if (currentSignupPage == login) {
            currentSignupPage = signup;
          }
          return true;
        },
        child: Scaffold(
          backgroundColor: white,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              margin: EdgeInsets.only(
                top: proportionalHeight(screenHeight, 50),
                bottom: proportionalHeight(screenHeight, 47),
                left: proportionalWidth(screenWidth, 36),
                right: proportionalWidth(screenWidth, 36),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // App Slogan
                  Text(
                    "Empowering Citizens,\nTracking Progress",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: proportionalHeight(screenHeight, 16),
                      fontWeight: FontWeight.bold,
                      color: black,
                    ),
                  ),

                  // South African map
                  widget.addMap
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Stack(
                            children: [
                              SvgPicture.asset(
                                "assets/images/South African Map.svg",
                                width: proportionalWidth(screenWidth, 140),
                                height: proportionalHeight(screenHeight, 140),
                              ),
                              Positioned(
                                left: proportionalWidth(screenWidth, 28),
                                top: proportionalHeight(screenHeight, 120),
                                child: SvgPicture.asset(
                                  "assets/images/South African Flag.svg",
                                  width: proportionalWidth(screenWidth, 12),
                                  height: proportionalHeight(screenHeight, 12),
                                ),
                              )
                            ],
                          ),
                        )
                      : const SizedBox(),

                  SizedBox(
                    height: proportionalHeight(screenHeight, 80),
                  ),

                  // Login or Signup option buttons
                  // Bring on top based on the current page
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: proportionalWidth(screenWidth, 220),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Stack(
                          children: [
                            //Login button
                            if (currentSignupPage == signup) ...{
                              LoginButton(buttonType: widget.buttonType),
                              SignupButton(buttonType: widget.buttonType),
                            },

                            //Signup button
                            if (currentSignupPage != signup) ...{
                              SignupButton(buttonType: widget.buttonType),
                              LoginButton(buttonType: widget.buttonType),
                            },
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: proportionalHeight(screenHeight, 36),
                  ),

                  // Child of the custom page
                  Align(
                    alignment: Alignment.centerLeft,
                    child: widget.childWidget,
                  ),

                  SizedBox(
                    height: proportionalHeight(screenHeight, 13),
                  ),

                  // Bottom button with circular progress indicator (optional)
                  // Login or Signup
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //circular progress indicator
                      widget.showButtonCircularProgressIndicator
                          ? SizedBox(
                              width: proportionalWidth(screenWidth, 20),
                              height: proportionalHeight(screenHeight, 20),
                              child: CircularProgressIndicator(
                                strokeWidth: proportionalWidth(screenWidth, 2),
                                color: navyBlue,
                              ),
                            )
                          : const SizedBox(),

                      SizedBox(
                        width: proportionalWidth(screenWidth, 10),
                      ),

                      // button
                      Align(
                        alignment: Alignment.centerRight,
                        child: widget.buttonType == ButtonType.login
                            ? // Login button
                            CustomButton(
                                textColor: white,
                                addButtonShadow: true,
                                onPressed: widget.onPressed,
                                text: "Login",
                              )
                            : widget.buttonType == ButtonType.signup
                                ? // Signup button
                                CustomButton(
                                    textColor: white,
                                    addButtonShadow: true,
                                    onPressed: widget.onPressed,
                                    text: "Sign up",
                                  )
                                : const SizedBox(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
