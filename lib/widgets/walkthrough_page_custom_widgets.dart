import 'widget_barrel.dart';
// Custom Widgets for the welcome screen

// The custom container for a page description
class AppWalkthrough extends StatelessWidget {
  // App description selector from description list
  final int appDescriptionIndex;
  const AppWalkthrough({super.key, required this.appDescriptionIndex});

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
          top: proportionalHeight(screenHeight, 50),
          bottom: proportionalHeight(screenHeight, 47),
          left: proportionalWidth(screenWidth, 32),
          right: proportionalWidth(screenWidth, 32),
        ),
        alignment: Alignment.center,
        width: proportionalWidth(screenWidth, 320),
        height: proportionalHeight(screenHeight, 225),
        decoration: const BoxDecoration(
          color: orange,
          borderRadius: BorderRadiusDirectional.all(
            Radius.circular(20),
          ),
        ),
        child: Text(
          textAlign: TextAlign.center,
          featureDescription[appDescriptionIndex],
          style: TextStyle(
            fontSize: proportionalHeight(screenHeight, 15),
            fontWeight: FontWeight.normal,
            color: white,
          ),
        ),
      ),
    );
  }
}

// App description text
//Limit to a size of 4
List<String> featureDescription = [
  "View Politician's Profiles",
  "Access Political Party Information",
  "Do you want an alert\nfor the State of the Nation Address?\nWe got you.",
  "Offline Access?\nLet's get started.",
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
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(
          width: proportionalWidth(screenWidth, 7),
        ),
        Container(
          width: proportionalWidth(screenWidth, 12),
          height: proportionalHeight(screenHeight, 12),
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
