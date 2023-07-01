import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

showSnackBar(String text, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: navyBlue,
      content: Text(
        text,
        style: const TextStyle(
          color: white,
          fontSize: 13,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
  );
}
