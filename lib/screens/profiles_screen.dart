import 'screen_barrel.dart';

class ProfilesScreen extends StatelessWidget {
  const ProfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    changeAppColors(context);
    return const Text(
      "Profiles: Upcoming Feature",
      style: TextStyle(
        color: black,
      ),
    );
  }
}
