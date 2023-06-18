import 'package:flutter/material.dart';
import '/utilities/app_colors.dart';
import '/utilities/dimension_methods.dart';

class AppWalkthrough extends StatelessWidget {
  final int featureIndex;
  const AppWalkthrough({super.key, required this.featureIndex});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: proportionalHeight(screenHeight, 32.5)),
      width: screenWidth,
      height: screenHeight,
      color: grey,
      child: Container(
        width: proportionalWidth(screenWidth, 320),
        height: proportionalHeight(screenHeight, 199),
        alignment: Alignment.center,
        child: Text(
          features[featureIndex],
          style: TextStyle(
            fontSize: proportionalHeight(screenHeight, 17),
            fontWeight: FontWeight.w500,
            color: black,
          ),
        ),
      ),
    );
  }
}

List<String> features = [
  "View Politician's Profiles",
  "Access Political Party Information",
  "Do you want an alert for the\nState of the Nation Address?\nWe got you.",
  "Offline Access?\nLet's get started."
];
