import 'package:flutter/material.dart';
import 'dimension_methods.dart';

class WelcomeBottomClipper extends CustomClipper<Path> {
  final double screenHeight;
  final double screenWidth;
  const WelcomeBottomClipper(this.screenWidth, this.screenHeight);

  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, proportionalHeight(screenHeight, 421));
    path.lineTo(0, screenHeight);
    path.lineTo(screenWidth, screenHeight);
    path.lineTo(screenWidth, proportionalHeight(screenHeight, 298));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
