import '../../services/auth/govtracksa_auth.dart';
import '../../utilities/navigators.dart';
import '../status_bar_container.dart';
import '../widget_barrel.dart';

class CustomSettingsPage extends StatelessWidget {
  const CustomSettingsPage(
      {super.key, required this.widget, required this.pageTitle});
  final Widget widget;
  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double appBarHeight = kToolbarHeight;
    double screenHeight =
        MediaQuery.of(context).size.height - statusBarHeight - appBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;

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
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pageTitle,
                style: TextStyle(
                  color: black,
                  fontSize: proportionalHeight(screenHeight, 18),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "${AppAuth.auth.currentUser?.userId}",
                style: TextStyle(
                  color: black,
                  fontSize: proportionalHeight(screenHeight, 12),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: proportionalWidth(screenWidth, 20),
              vertical: proportionalHeight(screenHeight, 20),
            ),
            child: Column(
              children: [
                widget,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
