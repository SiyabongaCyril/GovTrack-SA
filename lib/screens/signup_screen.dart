import 'package:gov_track_sa/widgets/custom_button_container.dart';
import 'package:gov_track_sa/widgets/signup_option_button.dart';
import 'package:gov_track_sa/widgets/status_bar_container.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import '/utilities/dimension_methods.dart';
import '/utilities/app_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  Color _loginButtonColor = white;
  Color _loginTextColor = black;
  Color _loginBorderColor = black;
  Color _signupButtonColor = black;
  Color _signupTextColor = white;
  Color _signupBorderColor = white;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;
    //  proportionalHeight(screenHeight, 73),
    //  proportionalWidth(screenWidth, 17),
    return StatusBarContainer(
      color: Colors.white,
      widget: Scaffold(
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
                  fontSize: proportionalHeight(screenHeight, 20),
                  fontWeight: FontWeight.bold,
                  color: black,
                ),
              ),
              Align(
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
              ),
              const Spacer(),
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
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _loginButtonColor = black;
                                _loginTextColor = white;
                                _signupButtonColor = white;
                                _signupTextColor = black;
                              });
                            },
                            child: CustomButtonContainer(
                              onPressed: () {},
                              text: "Login",
                              color: _loginButtonColor,
                              textColor: _loginTextColor,
                              borderColor: _loginBorderColor,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomButtonContainer(
                            onPressed: () {},
                            text: "Sign-up",
                            color: _signupButtonColor,
                            textColor: _signupTextColor,
                            borderColor: _signupBorderColor,
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
              const SignupOptionButton(
                text: "Gmail",
                widget: Icon(
                  Icons.logo_dev,
                ),
              ),
              SizedBox(
                height: proportionalHeight(screenHeight, 12),
              ),
              const SignupOptionButton(
                text: "Phone",
                widget: Icon(
                  Icons.call_rounded,
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
              Align(
                alignment: Alignment.centerRight,
                child: CustomButtonContainer(
                  onPressed: () {},
                  text: "Sign up",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
