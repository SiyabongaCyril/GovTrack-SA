import '../widget_barrel.dart';
import '../../utilities/enums.dart';
// CUSTOM WIDGETS FOR THE WELCOME SCREEN

// app description pages
class AppWalkthrough extends StatelessWidget {
  const AppWalkthrough({super.key, required this.appDescriptionIndex});

  // App description selector from description list
  final int appDescriptionIndex;

  @override
  Widget build(BuildContext context) {
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

// App description text (Limit: 4)
List<String> featureDescription = [
  "View Politician's Profiles:\n\nGet detailed information\nabout politicians.",
  "Access Political\nParty Information:\n\nStay up-to-date with the\nlatest "
      "news and events.",
  "Stay Informed with State of\nthe Nation Address Alerts:\n\nReceive "
      "notifications for \nimportant updates.",
  "Offline Access for On-the-Go:\n\nEnjoy offline access to\nstay connected "
      "even without\nan internet connection.",
];

// The circle that represents app description page number
class WalkthroughPageCircle extends StatelessWidget {
  const WalkthroughPageCircle({
    super.key,
    this.circleColor = CircleColors.white,
  });

  final CircleColors circleColor;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(
          width: proportionalWidth(screenWidth, 7),
        ),

        // Circle
        Container(
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
