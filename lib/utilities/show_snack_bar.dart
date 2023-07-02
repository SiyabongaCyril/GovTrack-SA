import 'package:flutter/material.dart';
import 'app_colors.dart';

showSnackBar(String text, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: navyBlue,
      content: Text(
        text,
        style: TextStyle(
          color: white,
          fontSize: 13,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
  );
}
