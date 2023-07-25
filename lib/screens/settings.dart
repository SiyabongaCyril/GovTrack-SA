import 'package:gov_track_sa/widgets/main_ui/custom_settings_page.dart';
import '../widgets/settings/setting_tile.dart';
import 'screen_barrel.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSettingsPage(
      pageTitle: "Settings",
      widget: Column(
        children: [
          // Account
          GestureDetector(
            onTap: () {
              navigateAndPushNamed(context, account);
            },
            child: const SettingTile(
              iconWidget: Icons.person,
              title: "Account",
              description:
                  "View and update your account information, including personal details and preferences.",
            ),
          ),

          const SettingTile(
            iconWidget: Icons.notifications,
            title: "Notifications/Alerts",
            description:
                "Configure your notification and alert settings to stay informed about important updates and events.",
          ),

          const SettingTile(
            iconWidget: Icons.storage,
            title: "Storage",
            description:
                "Manage your storage options, including cloud storage settings and local storage preferences.",
          ),

          const SettingTile(
            iconWidget: Icons.support,
            title: "Support",
            description:
                "Access support resources, FAQs, and contact options for assistance with the app or any issues you encounter.",
          ),
        ],
      ),
    );
  }
}
