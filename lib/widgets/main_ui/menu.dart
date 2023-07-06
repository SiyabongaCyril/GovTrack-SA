//Main UI's  Main Menu
import '../../utilities/enums.dart';
import '../../utilities/navigators.dart';
import '../../utilities/show_error_dialog.dart';
import '../widget_barrel.dart';
import 'styles.dart';

class PopupMenu extends StatefulWidget {
  const PopupMenu({super.key});

  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return PopupMenuButton<MenuItems>(
      color: white,
      position: PopupMenuPosition.over,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onSelected: (value) async {
        switch (value) {
          case MenuItems.settings:
            Navigator.pushNamed(context, settings);
            break;
          case MenuItems.logout:
            showErrorDialog(
              context,
              "Are you sure you want to logout?",
            );
            break;
        }
      },
      // Menu Icon
      icon: Icon(
        Icons.menu,
        color: black,
        size: proportionalWidth(screenWidth, 25),
      ),
      itemBuilder: (context) {
        return [
          // Settings
          PopupMenuItem(
            value: MenuItems.settings,
            child: Row(
              children: [
                Icon(
                  Icons.settings_rounded,
                  color: black,
                  size: proportionalWidth(screenWidth, 15),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Settings",
                  style: dropDownMenuTextStyle,
                ),
              ],
            ),
          ),
          // Logout
          PopupMenuItem(
            value: MenuItems.logout,
            child: Row(
              children: [
                Icon(
                  Icons.logout_rounded,
                  color: black,
                  size: proportionalWidth(screenWidth, 15),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Logout",
                  style: dropDownMenuTextStyle,
                ),
              ],
            ),
          ),
        ];
      },
    );
  }
}
