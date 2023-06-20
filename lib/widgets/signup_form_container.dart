import 'package:flutter/material.dart';
import 'package:gov_track_sa/utilities/app_colors.dart';
import '/utilities/dimension_methods.dart';

class SignupFormContainer extends StatelessWidget {
  const SignupFormContainer({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;
    //  proportionalHeight(screenHeight, 73),
    //  proportionalWidth(screenWidth, 17),
    return Center(
      child: Container(
        width: proportionalWidth(screenWidth, 287),
        height: proportionalHeight(screenHeight, 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1,
            color: black,
          ),
        ),
        child: widget,
      ),
    );
  }
}
