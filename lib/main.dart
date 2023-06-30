import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gov_track_sa/screens/phone_number_signin_screen.dart';
import 'package:gov_track_sa/screens/signup_screen.dart';
//import 'package:gov_track_sa/screens/test_screen.dart';
import 'package:gov_track_sa/services/auth/govtracksa_auth.dart';
import 'package:gov_track_sa/utilities/navigators.dart';
import 'screens/email_signup_screen.dart';
import 'screens/login_screen.dart';
import 'screens/welcome_screen.dart';
import 'widgets/main_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppAuth.auth.initialise();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GovTrackSA",
      // Remove color from status bar
      // Set the app's first route (Welcome Screen)
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: AppAuth.auth.currentUser != null
            ? const MainUI()
            : const WelcomeScreen(),
      ), // Set the home screen to WelcomeScreen
      // App theme
      theme: ThemeData(
        fontFamily: "Montserrat", // Set the default font family
      ),
      // Define the app's named routes
      routes: {
        signup: (context) => const SignupScreen(),
        emailsignup: (context) => const EmailSignupScreen(),
        login: (context) => const LoginScreen(),
        phonesignup: (context) => const PhoneSignupScreen(),
        mainui: (context) => const MainUI(),
      },
    );
  }
}
