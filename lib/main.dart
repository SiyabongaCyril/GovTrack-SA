import 'package:flutter/material.dart';
import 'package:gov_track_sa/screens/phone_number_signin_screen.dart';
import 'package:gov_track_sa/screens/signup_screen.dart';
import 'package:gov_track_sa/utilities/navigators.dart';
import 'screens/gmail_signup_screen.dart';
import 'screens/login_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  const MyApp({super.key});

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
        gmailsignup: (context) => const GmailSignupScreen(),
        login: (context) => const LoginScreen(),
        phonesignup: (context) => const PhoneSignupScreen(),
      },
    );
  }
}
