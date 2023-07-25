import '../widget_barrel.dart';

// A custom dropdown item with a title and dropdown content
class DropdownItem extends StatelessWidget {
  const DropdownItem({
    super.key,
    required this.isItemOpen,
    required this.title,
    this.content = const [
      SizedBox(),
    ],
  });
  final bool isItemOpen;
  final String title;
  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double appBarHeight = kToolbarHeight;
    double bottomNavBarHeight = MediaQuery.of(context).padding.bottom;

    double screenHeight = MediaQuery.of(context).size.height -
        statusBarHeight -
        appBarHeight -
        bottomNavBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;
    // dropDown items padding and margin values
    SizedBox dropDownBottomSpace = SizedBox(
      height: proportionalHeight(screenHeight, 8),
    );

    EdgeInsets openDropDownMargin = EdgeInsets.only(
      left: proportionalWidth(screenWidth, 15),
      top: proportionalHeight(screenHeight, 5),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isItemOpen
                ? Icon(
                    Icons.arrow_drop_down,
                    color: orange,
                  )
                : Icon(
                    Icons.arrow_right,
                    color: orange,
                  ),

            // Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: navyBlue,
              ),
            ),
          ],
        ),

        // Dropdown content
        isItemOpen
            ? Container(
                margin: openDropDownMargin,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: content,
                ),
              )
            : Container(),
        dropDownBottomSpace,
      ],
    );
  }
}
