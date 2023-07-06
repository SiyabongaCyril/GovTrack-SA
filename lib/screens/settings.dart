import 'screen_barrel.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    changeAppColors(context);
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double appBarHeight = kToolbarHeight;
    double screenHeight =
        MediaQuery.of(context).size.height - statusBarHeight - appBarHeight;
    //double screenWidth = MediaQuery.of(context).size.width;

    return StatusBarContainer(
      color: white,
      widget: Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: black,
            ),
            onPressed: () {
              navigatePop(context);
            },
          ),
          title: Text(
            "Settings",
            style: TextStyle(
              color: black,
              fontSize: proportionalHeight(screenHeight, 18),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        backgroundColor: white,
        body: const Center(
          child: Text(
            "Settings Page: Upcoming feature",
            style: TextStyle(
              color: black,
            ),
          ),
        ),
      ),
    );
  }
}
