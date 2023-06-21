import 'package:flutter/material.dart';

// App navigators
const signup = "/signup";

// Methods for navigation

void navigateAndPushNamed(
  BuildContext context,
  final route,
) {
  Navigator.of(context).pushNamed(route);
}

void navigatePushNamedAndRemoveUntil(BuildContext context, final route) {
  Navigator.of(context).pushNamedAndRemoveUntil(
    route,
    (route) => false,
  );
}

void navigateAndPop(BuildContext context) {
  Navigator.of(context).pop();
}
