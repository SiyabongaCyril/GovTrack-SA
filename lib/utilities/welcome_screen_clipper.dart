import 'package:flutter/material.dart';
import 'dimension_methods.dart';

// Welcome screen clipper for the custom shape with gradient
class WelcomeScreenClipper extends CustomClipper<Path> {
  const WelcomeScreenClipper(this.screenWidth, this.screenHeight);

  final double screenHeight, screenWidth;

  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, proportionalHeight(screenHeight, 495));
    path.lineTo(0, screenHeight);
    path.lineTo(screenWidth, screenHeight);
    path.lineTo(screenWidth, proportionalHeight(screenHeight, 298));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
