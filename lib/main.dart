import 'package:flutter/material.dart';
import 'package:gov_track_sa/screens/signup_screen.dart';
import 'package:gov_track_sa/utilities/navigators.dart';
import 'screens/welcome_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WelcomeScreen(), // Set the home screen to WelcomeScreen
      theme: ThemeData(
        fontFamily: "Montserrat", // Set the default font family
      ),
      routes: {
        // Define app's named routes
        signup: (context) => const SignupScreen(),
      },
    );
  }
}
