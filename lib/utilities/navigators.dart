import 'package:flutter/material.dart';

const getStarted = "/getstarted";

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
