import 'dart:developer';
import 'package:gov_track_sa/screens/screen_barrel.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ButtonType { login, signup, none }

class SignupLoginSamplePage extends StatefulWidget {
  final Widget childWidget;
  final ButtonType buttonType;
  final bool addMap;

  const SignupLoginSamplePage({
    super.key,
    required this.childWidget,
    this.buttonType = ButtonType.none,
    this.addMap = true,
  });

  @override
  State<SignupLoginSamplePage> createState() => _SignupLoginSamplePageState();
}

class _SignupLoginSamplePageState extends State<SignupLoginSamplePage> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;

    return StatusBarContainer(
      color: Colors.white,
      widget: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.only(
            top: proportionalHeight(screenHeight, 50),
            bottom: proportionalHeight(screenHeight, 47),
            left: proportionalWidth(screenWidth, 36),
            right: proportionalWidth(screenWidth, 36),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Empowering Citizens,\nTracking Progress",
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: proportionalHeight(screenHeight, 18),
                  fontWeight: FontWeight.bold,
                  color: black,
                ),
              ),
              widget.addMap
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            "assets/images/South African Map.svg",
                            width: proportionalWidth(screenWidth, 150),
                            height: proportionalHeight(screenHeight, 150),
                          ),
                          Positioned(
                            left: proportionalWidth(screenWidth, 28),
                            top: proportionalHeight(screenHeight, 120),
                            child: SvgPicture.asset(
                              "assets/images/South African Flag.svg",
                              width: proportionalWidth(screenWidth, 20),
                              height: proportionalHeight(screenHeight, 20),
                            ),
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
              SizedBox(
                height: proportionalHeight(screenHeight, 30),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: proportionalWidth(screenWidth, 230),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: CustomButtonContainer(
                            onPressed: () {
                              log("${ModalRoute.of(context)?.settings.name}");
                              bool isLoginRoute =
                                  ModalRoute.of(context)?.settings.name ==
                                      login;

                              if (isLoginRoute) {
                                return;
                              } else {
                                navigateToRouteAndPop(context, login, signup);
                              }
                            },
                            text: "Login",
                            color: widget.buttonType == ButtonType.login
                                ? black
                                : white,
                            textColor: widget.buttonType == ButtonType.login
                                ? white
                                : black,
                            borderColor: black,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomButtonContainer(
                            onPressed: () {
                              log("${ModalRoute.of(context)?.settings.name}");
                              bool isSignupRoute =
                                  ModalRoute.of(context)?.settings.name ==
                                      signup;

                              if (isSignupRoute) {
                                return;
                              } else {
                                navigateToRouteAndPop(context, signup, login);
                              }
                            },
                            text: "Sign-up",
                            color: widget.buttonType == ButtonType.login
                                ? white
                                : black,
                            textColor: widget.buttonType == ButtonType.login
                                ? black
                                : white,
                            borderColor: black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: proportionalHeight(screenHeight, 36),
              ),
              Align(alignment: Alignment.centerLeft, child: widget.childWidget),
              SizedBox(height: proportionalHeight(screenHeight, 13)),
              Align(
                alignment: Alignment.centerRight,
                child: widget.buttonType == ButtonType.login
                    ? CustomButtonContainer(
                        onPressed: () {
                          navigatePushNamedAndRemoveUntil(context, homepage);
                        },
                        text: "Login",
                      )
                    : widget.buttonType == ButtonType.signup
                        ? CustomButtonContainer(
                            onPressed: () {},
                            text: "Sign up",
                          )
                        : const SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
