import '../widget_barrel.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.iconWidget,
    required this.title,
    required this.description,
  });
  final Widget iconWidget;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double appBarHeight = kToolbarHeight;
    double screenHeight =
        MediaQuery.of(context).size.height - statusBarHeight - appBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(
        bottom: proportionalHeight(screenHeight, 20),
      ),
      child: Row(
        children: [
          // Setting Icon
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              right: proportionalHeight(screenHeight, 30),
            ),
            child: iconWidget,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Setting Title
              Text(
                title,
                style: TextStyle(
                  fontSize: proportionalHeight(screenHeight, 16),
                  fontWeight: FontWeight.w600,
                ),
              ),

              // Setting Description
              Container(
                padding: EdgeInsets.only(
                  top: proportionalHeight(screenHeight, 2.5),
                ),
                width: proportionalWidth(screenWidth, 260),
                child: Text(
                  description,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: proportionalHeight(screenHeight, 14),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
