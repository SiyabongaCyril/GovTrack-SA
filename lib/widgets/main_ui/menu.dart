//Main UI's  Main Menu

import '../../services/auth/govtracksa_auth.dart';
import '../../utilities/enums.dart';
import '../../utilities/helper_variables.dart';
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
          case MenuItems.bookmarks:
            break;
          case MenuItems.syncApp:
            break;
          case MenuItems.referUs:
            break;
          case MenuItems.logout:
            showErrorDialog(
                context, "Are you sure you want to logout?", "Logout",
                () async {
              await AppAuth.auth.logOut(context: context).then((value) {
                currentSignupPage = login;
                navigatePushNamedAndRemoveUntil(context, login);
              });
            });
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
          const PopupMenuItem(
            value: MenuItems.settings,
            child: MenuItem(
              text: "Settings",
              icon: Icons.settings_rounded,
            ),
          ),

          // Bookmarks
          const PopupMenuItem(
            value: MenuItems.bookmarks,
            child: MenuItem(
              text: "Bookmarks",
              icon: Icons.bookmarks_rounded,
            ),
          ),

          // Sync App
          const PopupMenuItem(
            value: MenuItems.syncApp,
            child: MenuItem(
              text: "Sync",
              icon: Icons.sync_rounded,
            ),
          ),

          // Refer Us
          const PopupMenuItem(
            value: MenuItems.referUs,
            child: MenuItem(
              text: "Refer Us",
              icon: Icons.share_rounded,
            ),
          ),

          // Logout
          const PopupMenuItem(
            value: MenuItems.logout,
            child: MenuItem(
              text: "Logout",
              icon: Icons.logout_rounded,
            ),
          ),
        ];
      },
    );
  }
}

// Menu Items
class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ListTile(
      minLeadingWidth: 0,
      leading: Icon(
        icon,
        color: black,
        size: proportionalWidth(screenWidth, 15),
      ),
      title: Text(
        text,
        style: dropDownMenuTextStyle,
      ),
    );
  }
}
