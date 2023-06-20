import 'package:gov_track_sa/widgets/app_walkthrough_container.dart';
import 'package:gov_track_sa/widgets/walkthrough_page_circle.dart';
import 'package:gov_track_sa/utilities/navigators.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import '/utilities/welcome_screen_clipper.dart';
import '/utilities/dimension_methods.dart';
import '/utilities/app_colors.dart';
import '/widgets/status_bar_container.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int pageNum = 0;
  bool showButton = false;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;

    return StatusBarContainer(
      color: navyBlue,
      widget: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              color: navyBlue,
            ),
            Positioned(
              top: proportionalHeight(screenHeight, 53),
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
            Positioned(
              left: proportionalWidth(screenWidth, 0),
              top: proportionalHeight(screenHeight, 200),
              child: SvgPicture.asset(
                "assets/images/Person-Information_Icon.svg",
                width: proportionalWidth(screenWidth, 210),
                height: proportionalHeight(screenHeight, 210),
              ),
            ),
            ClipPath(
              clipper: WelcomeBottomClipper(screenWidth, screenHeight),
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    pageNum = value;
                    if (pageNum == 3) showButton = true;
                  });
                },
                scrollDirection: Axis.horizontal,
                children: [
                  for (var i = 0; i < 4; i++) AppWalkthrough(featureIndex: i),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(
                  bottom: proportionalHeight(screenWidth, 52.5),
                ),
                width: screenWidth,
                color: white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: proportionalWidth(screenWidth, 13),
                    ),
                    for (var i = 0; i < 4; i++)
                      WalkthroughPageCircle(
                          circleColor: pageNum == i
                              ? CircleColors.orange
                              : CircleColors.white),
                  ],
                ),
              ),
            ),
            showButton
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: proportionalHeight(screenHeight, 18.5),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: proportionalWidth(screenWidth, 131),
                              height: proportionalHeight(screenHeight, 33),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                color: navyBlue,
                              ),
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                    shadowColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.transparent)),
                                onPressed: () {
                                  navigateAndPushNamed(context, signup);
                                },
                                child: const Text("Get Started"),
                              ),
                            ),
                            SizedBox(
                              width: proportionalWidth(screenWidth, 20),
                            )
                          ]),
                    ),
                  )
                : SizedBox(
                    width: proportionalWidth(screenWidth, 26),
                  )
          ],
        ),
      ),
    );
  }
}
