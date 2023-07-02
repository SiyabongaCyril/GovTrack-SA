import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gov_track_sa/utilities/app_colors.dart';
import 'package:gov_track_sa/screens/forgot_password_screen.dart';
import 'package:gov_track_sa/screens/phone_number_signin_screen.dart';
import 'package:gov_track_sa/screens/signup_screen.dart';
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

class MyApp extends StatefulWidget {
  // This widget is the root of the application.
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // Set the app's orientation to portra
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GovTrackSA",
      // Remove color from status bar
      // Set the app's first route (Welcome Screen)
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: AppAuth.auth.currentUser != null
            ? const MainUI()
            : const WelcomeScreen(),
      ), // Set the home screen to WelcomeScreen
      // App theme
      theme: ThemeData.light().copyWith(primaryColor: navyBlue),
      darkTheme: ThemeData.dark().copyWith(primaryColor: navyBlue),
      routes: {
        signup: (context) => const SignupScreen(),
        emailsignup: (context) => const EmailSignupScreen(),
        login: (context) => const LoginScreen(),
        phonesignup: (context) => const PhoneSignupScreen(),
        mainui: (context) => const MainUI(),
        forgotpassword: (context) => const ForgotPasswordScreen(),
      },
    );
  }
}
