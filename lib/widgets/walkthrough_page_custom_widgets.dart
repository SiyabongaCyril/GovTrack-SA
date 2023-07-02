import 'widget_barrel.dart';
// Custom Widgets for the welcome screen

// The custom container for app description pages
class AppWalkthrough extends StatelessWidget {
  // App description selector from description list
  final int appDescriptionIndex;
  const AppWalkthrough({super.key, required this.appDescriptionIndex});

  @override
  Widget build(BuildContext context) {
    changeAppColors(context);
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: proportionalHeight(screenHeight, 80)),
      width: screenWidth,
      height: screenHeight,
      color: white,
      child: Container(
        padding: EdgeInsets.only(
          top: proportionalHeight(screenHeight, 20),
          bottom: proportionalHeight(screenHeight, 20),
          left: proportionalWidth(screenWidth, 32),
          right: proportionalWidth(screenWidth, 32),
        ),
        alignment: Alignment.center,
        width: proportionalWidth(screenWidth, 290),
        height: proportionalHeight(screenHeight, 190),
        decoration: BoxDecoration(
          border: const Border.fromBorderSide(
            BorderSide(
              color: navyBlue,
              width: 1,
            ),
          ),
          color: grey,
          borderRadius: const BorderRadiusDirectional.all(
            Radius.circular(30),
          ),
        ),
        // Description
        child: Text(
          textAlign: TextAlign.justify,
          featureDescription[appDescriptionIndex],
          style: TextStyle(
            fontSize: proportionalHeight(screenHeight, 14),
            fontWeight: FontWeight.w300,
            color: black,
          ),
        ),
      ),
    );
  }
}

// App description text
//Limit to a size of 4
List<String> featureDescription = [
  "View Politician's Profiles:\n\nGet detailed information\nabout politicians.",
  "Access Political\nParty Information:\n\nStay up-to-date with the\nlatest "
      "news and events.",
  "Stay Informed with State of\nthe Nation Address Alerts:\n\nReceive "
      "notifications for \nimportant updates.",
  "Offline Access for On-the-Go:\n\nEnjoy offline access to\nstay connected "
      "even without\nan internet connection.",
];

enum CircleColors { white, orange }

// The custom widget for the circle that represents
// app description page number
class WalkthroughPageCircle extends StatelessWidget {
  final CircleColors circleColor;
  const WalkthroughPageCircle(
      {super.key, this.circleColor = CircleColors.white});

  @override
  Widget build(BuildContext context) {
    changeAppColors(context);
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(
          width: proportionalWidth(screenWidth, 7),
        ),
        Container(
          // Circle size
          width: proportionalWidth(screenWidth, 10),
          height: proportionalHeight(screenHeight, 10),
          decoration: BoxDecoration(
            border: const Border.fromBorderSide(
              BorderSide(
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            shape: BoxShape.circle,
            color: circleColor == CircleColors.white ? white : orange,
          ),
        ),
      ],
    );
  }
}
