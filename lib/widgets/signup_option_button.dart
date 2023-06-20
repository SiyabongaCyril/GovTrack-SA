import 'package:flutter/material.dart';
import 'package:gov_track_sa/utilities/app_colors.dart';
import 'package:gov_track_sa/widgets/signup_form_container.dart';
import '/utilities/dimension_methods.dart';

class SignupOptionButton extends StatelessWidget {
  const SignupOptionButton(
      {super.key, required this.text, required this.widget});
  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;
    //  proportionalHeight(screenHeight, 73),
    //  proportionalWidth(screenWidth, 17),
    return SignupFormContainer(
      widget: Row(
        children: [
          SizedBox(
            width: proportionalWidth(screenWidth, 26),
          ),
          SizedBox(
            child: widget,
          ),
          SizedBox(
            width: proportionalWidth(screenWidth, 19),
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: proportionalHeight(screenHeight, 16),
                color: navyBlue),
          ),
        ],
      ),
    );
  }
}
