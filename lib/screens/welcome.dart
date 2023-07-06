import '../utilities/enums.dart';
import 'screen_barrel.dart';
import 'package:gov_track_sa/widgets/welcome/app_walkthrough.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/utilities/welcome_screen_clipper.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  //app-feature's description page number
  int pageNum = 0;

  // Get started button visibility
  // (only visible on the last app description page)
  bool showButton = false;

  @override
  Widget build(BuildContext context) {
    changeAppColors(context);

    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;

    return StatusBarContainer(
      color: navyBlue,
      widget: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            //The top clipped container
            Container(
              width: screenWidth,
              height: screenHeight,
              color: navyBlue,
            ),

            //Welcome Text, render on top of the top clipped container
            Positioned(
              top: proportionalHeight(screenHeight, 53),
              left: proportionalWidth(screenWidth, 20),
              child: Text(
                textAlign: TextAlign.justify,
                "Welcome to GovTrackSA,\n"
                "Your go to app to stay up to date\n\n"
                "Your government info\n"
                "All in one place!",
                style: TextStyle(
                  fontSize: proportionalHeight(screenHeight, 15),
                  fontWeight: FontWeight.w300,
                  color: white,
                ),
              ),
            ),

            //image rendered on top of the top clipped container
            Positioned(
              left: proportionalWidth(screenWidth, 100),
              top: proportionalHeight(screenHeight, 180),
              child: SvgPicture.asset(
                "assets/images/Person-Information_Icon.svg",
                width: proportionalWidth(screenWidth, 150),
                height: proportionalHeight(screenHeight, 150),
              ),
            ),

            // Clipper & PageView: App Descriptions
            ClipPath(
              clipper: WelcomeScreenClipper(screenWidth, screenHeight),

              //Page view for all the application descriptions
              child: PageView(
                onPageChanged: (value) {
                  setState(
                    () {
                      pageNum = value;
                      if (pageNum == 3) showButton = true;
                      //show the get started button on the last page
                    },
                  );
                },

                scrollDirection: Axis.horizontal,

                //Navigation pages
                children: [
                  for (var i = 0; i < 4; i++)
                    AppWalkthrough(appDescriptionIndex: i),
                ],
              ),
            ),

            //Page navigation circles & get started container
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

                    //Page navigation circles
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
                //render the get started button on the last page
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: proportionalHeight(screenHeight, 18.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomButton(
                            textColor: white,
                            addButtonShadow: true,
                            text: "Get started",
                            onPressed: () =>
                                navigateAndPushNamed(context, signup),
                          ),
                          SizedBox(
                            width: proportionalWidth(screenWidth, 20),
                          )
                        ],
                      ),
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
