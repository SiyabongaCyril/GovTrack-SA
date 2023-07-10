import 'package:gov_track_sa/services/auth/govtracksa_auth.dart';
import 'package:gov_track_sa/utilities/show_error_dialog.dart';

import '../widgets/main_ui/custom_settings_page.dart';
import '../widgets/settings/setting_tile.dart';
import 'screen_barrel.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSettingsPage(
      pageTitle: "Account",
      widget: Column(
        children: [
          GestureDetector(
            onTap: () {
              showErrorDialog(
                  context,
                  "Are you sure you want to delete your account permanently?",
                  "Delete account", () {
                AppAuth.auth.deleteAccount(context: context).then(
                      (value) =>
                          navigatePushNamedAndRemoveUntil(context, login),
                    );
              });
            },
            child: const SettingTile(
                description:
                    "Permanently delete your account and all associated data. This action cannot be undone, and you will lose access to your account.",
                iconWidget: Icon(Icons.delete),
                title: "Delete Account"),
          )
        ],
      ),
    );
  }
}
