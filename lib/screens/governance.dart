import 'screen_barrel.dart';

class GovernanceScreen extends StatelessWidget {
  const GovernanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    changeAppColors(context);
    return const Text(
      "Governance: Upcoming Feature",
      style: TextStyle(
        color: black,
      ),
    );
  }
}
