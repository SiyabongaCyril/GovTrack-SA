import '../screen_barrel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Home: Upcoming Feature, still in development.",
        style: TextStyle(
          color: black,
        ),
      ),
    );
  }
}
