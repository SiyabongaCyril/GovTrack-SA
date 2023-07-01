import 'dart:developer';
import 'package:flutter/material.dart';

// App navigators
const signup = "/signup";
const emailsignup = "/gmailsignup";
const login = "/login";
const welcome = "/welcome";
const phonesignup = "/phonesignup";
const homepage = "/homepage";
const mainui = "/mainui";
const forgotpassword = "/forgotpassword";

// Methods for navigation

// Navigate to a named route
void navigateAndPushNamed(
  BuildContext context,
  String route,
) {
  Navigator.of(context).pushNamed(route);
}

// Navigate to a named route and remove all routes below it
void navigatePushNamedAndRemoveUntil(BuildContext context, final route) {
  Navigator.of(context).pushNamedAndRemoveUntil(
    route,
    (route) => false,
  );
}

// Navigate to previous route and remove current route
void navigatePop(BuildContext context) {
  Navigator.of(context).pop();
}

// Navigate to a named route and remove the current route
void navigateToRouteAndPop(BuildContext context, newRoute, final oldRoute) {
  log("In Navigate to Route and Pop Function");
  Navigator.pushReplacementNamed(context, newRoute);
  Navigator.removeRouteBelow(context, oldRoute);
}
