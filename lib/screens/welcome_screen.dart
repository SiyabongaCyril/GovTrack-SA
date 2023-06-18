import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gov_track_sa/utilities/navigators.dart';
import 'package:gov_track_sa/widgets/app_walkthrough_container.dart';
import 'package:gov_track_sa/widgets/walkthrough_page_circle.dart';
import '/utilities/welcome_screen_clipper.dart';
import '/utilities/dimension_methods.dart';
import '/widgets/status_bar_container.dart';
import '/utilities/app_colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int pageNum = 0;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;

    return StatusBarContainer(
      widget: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              color: blue,
            ),
            Positioned(
              top: proportionalHeight(screenHeight, 73),
              left: proportionalWidth(screenWidth, 17),
              child: Text(
                "Welcome to GovTrackSA,\n"
                "Your go to app to stay up to\ndate\n\n"
                "Your government info\n"
                "All In One Place!",
                style: TextStyle(
                  fontSize: proportionalHeight(screenHeight, 20),
                  fontWeight: FontWeight.w600,
                  color: white,
                ),
              ),
            ),
            ClipPath(
              clipper: WelcomeBottomClipper(screenWidth, screenHeight),
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    pageNum = value;
                    log("$pageNum");
                  });
                },
                scrollDirection: Axis.horizontal,
                children: const [
                  AppWalkthrough(featureIndex: 0),
                  AppWalkthrough(featureIndex: 1),
                  AppWalkthrough(featureIndex: 2),
                  AppWalkthrough(featureIndex: 3)
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(
                    bottom: proportionalHeight(screenWidth, 32.5)),
                width: screenWidth,
                color: grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    WalkthroughPageCircle(
                        circleColor: pageNum == 0 ? orange : white),
                    WalkthroughPageCircle(
                        circleColor: pageNum == 1 ? orange : white),
                    WalkthroughPageCircle(
                        circleColor: pageNum == 2 ? orange : white),
                    WalkthroughPageCircle(
                        circleColor: pageNum == 3 ? orange : white),
                    pageNum == 3
                        ? Row(children: [
                            SizedBox(
                              width: proportionalWidth(screenWidth, 14),
                            ),
                            Container(
                              padding: EdgeInsets.zero,
                              width: proportionalWidth(screenWidth, 130),
                              height: proportionalHeight(screenHeight, 33),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: black,
                              ),
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                    shadowColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.transparent)),
                                onPressed: () {
                                  navigateAndPushNamed(context, getStarted);
                                },
                                child: const Text("Get Started"),
                              ),
                            ),
                            SizedBox(
                              width: proportionalWidth(screenWidth, 26),
                            )
                          ])
                        : SizedBox(
                            width: proportionalWidth(screenWidth, 26),
                          )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
