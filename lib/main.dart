import 'package:flutter/material.dart';
import 'package:gov_track_sa/screens/get_started.dart';
import 'package:gov_track_sa/utilities/navigators.dart';
//import 'package:gov_track_sa/screens/testing_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GovTrackSA();
  }
}

class GovTrackSA extends StatelessWidget {
  const GovTrackSA({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WelcomeScreen(),
      theme: ThemeData(
        fontFamily: "Montserrat",
      ),
      routes: {getStarted: (context) => const GetStartedScreen()},
    );
  }
}
