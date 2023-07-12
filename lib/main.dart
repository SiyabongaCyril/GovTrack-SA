import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gov_track_sa/screens/account.dart';
import 'package:gov_track_sa/utilities/app_colors.dart';
import 'package:gov_track_sa/screens/forgot_password.dart';
import 'package:gov_track_sa/screens/phone_signup.dart';
import 'package:gov_track_sa/screens/signup.dart';
import 'package:gov_track_sa/services/auth/govtracksa_auth.dart';
import 'package:gov_track_sa/utilities/navigators.dart';
import 'screens/email_signup.dart';
import 'screens/login.dart';
import 'screens/settings.dart';
import 'screens/welcome.dart';
import 'widgets/main_ui/main_ui.dart';

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
    // Set the app's orientation to portrait
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "GovTrackSA",

      // Make the status bar transparent
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: AppAuth.auth.currentUser != null
            ? const MainUI()
            : const WelcomeScreen(),
      ),

      theme: ThemeData(appBarTheme: const AppBarTheme(elevation: 0.5)),

      routes: {
        signup: (context) => const SignupScreen(),
        emailsignup: (context) => const EmailSignupScreen(),
        login: (context) => const LoginScreen(),
        phonesignup: (context) => const PhoneSignupScreen(),
        mainui: (context) => const MainUI(),
        forgotpassword: (context) => const ForgotPasswordScreen(),
        settings: (context) => const SettingsScreen(),
        account: (context) => const AccountSetting(),
      },
    );
  }
}
