import 'screen_barrel.dart';

class ElectionsScreen extends StatelessWidget {
  const ElectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    changeAppColors(context);
    return const Text(
      "Elections: Upcoming Feature",
      style: TextStyle(
        color: black,
      ),
    );
  }
}
