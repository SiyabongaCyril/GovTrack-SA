import 'package:flutter/material.dart';

// Application's primary colours
const Color black = Color(0xFF000000);
Color grey = const Color(0xFFD9D9D9);
Color white = const Color(0xFFFFFFFF);
//const Color orange = Color.fromARGB(255, 180, 107, 65);
const Color navyBlue = Color(0xFF0D439B);
const Color red = Color(0xFFE80C0C);
Color orange = const Color(0xFFE86D24);
const Color transparent = Colors.transparent;
bool isDarkModeOn = false;

void appColorsFromDark() {
  white = const Color.fromARGB(255, 153, 152, 152);
  grey = const Color.fromARGB(255, 153, 152, 152);
  orange = const Color.fromARGB(255, 180, 107, 65);
  isDarkModeOn = true;
}

void appColorsFromLight() {
  white = const Color(0xFFFFFFFF);
  grey = const Color(0xFFD9D9D9);
  orange = const Color(0xFFE86D24);
  isDarkModeOn = false;
}

// Change the app's colours based on the device's brightness mode
void changeAppColors(BuildContext context) {
  if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
    appColorsFromDark();
  } else {
    appColorsFromLight();
  }
}
