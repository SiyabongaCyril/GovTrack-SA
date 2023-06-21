import 'dart:developer';

import 'package:flutter/material.dart';

// App navigators
const signup = "/signup";
const gmailsignup = "/gmailsignup";
const login = "/login";
const welcome = "/welcome";
const phonesignup = "/phonesignup";

// Methods for navigation

void navigateAndPushNamed(
  BuildContext context,
  String route,
) {
  Navigator.of(context).pushNamed(route);
}

void navigatePushNamedAndRemoveUntil(BuildContext context, final route) {
  Navigator.of(context).pushNamedAndRemoveUntil(
    route,
    (route) => false,
  );
}

// void navigatePop(BuildContext context) {
//   Navigator.of(context).pop();
// }

void navigateToRouteAndPop(BuildContext context, newRoute, final oldRoute) {
  log("In Navigate to Route and Pop Function");
  Navigator.pushReplacementNamed(context, newRoute);
  Navigator.removeRouteBelow(context, oldRoute);
}
