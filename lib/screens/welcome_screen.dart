import 'screen_barrel.dart';
import 'package:gov_track_sa/widgets/walkthrough_page_custom_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/utilities/welcome_screen_clipper.dart';

//App's first route, the welcome screen
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  //track's application description's current page
  int pageNum = 0;
  //the welcome page-button to the next page will only render
  //if the last page of  application description's pages has been viewed
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
            //The container
            Container(
              width: screenWidth,
              height: screenHeight,
              color: navyBlue,
            ),
            //Welcome Text, render on top of the top clipped container
            Positioned(
              top: proportionalHeight(screenHeight, 53),
              left: proportionalWidth(screenWidth, 17),
              child: Text(
                textAlign: TextAlign.justify,
                "Welcome to GovTrackSA,\n"
                "Your go to app to stay up to date\n\n"
                "Your government info\n"
                "All in one place!",
                style: TextStyle(
                  fontSize: proportionalHeight(screenHeight, 18),
                  fontWeight: FontWeight.w400,
                  color: white,
                ),
              ),
            ),
            //image rendered on top of the top clipped container
            Positioned(
              left: proportionalWidth(screenWidth, 0),
              top: proportionalHeight(screenHeight, 200),
              child: SvgPicture.asset(
                "assets/images/Person-Information_Icon.svg",
                width: proportionalWidth(screenWidth, 210),
                height: proportionalHeight(screenHeight, 210),
              ),
            ),
            //The bottom clipped container & its contents
            //(Page navigation circles & navigation pages)
            ClipPath(
              clipper: WelcomeBottomClipper(screenWidth, screenHeight),
              //Page view for all the application description pages
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    pageNum = value;
                    if (pageNum == 3) showButton = true;
                    //show navigation button on last page
                  });
                },
                scrollDirection: Axis.horizontal,
                //Navigation pages
                children: [
                  for (var i = 0; i < 4; i++)
                    AppWalkthrough(appDescriptionIndex: i),
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
                          CustomButtonContainer(
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
