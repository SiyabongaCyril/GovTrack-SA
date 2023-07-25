import 'package:gov_track_sa/widgets/public_servant_card.dart';

import '../screen_barrel.dart';

class ProfilesScreen extends StatelessWidget {
  const ProfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        //add a page transition animation
        scrollBehavior: const MaterialScrollBehavior(),
        itemBuilder: (context, index) {
          return cyrilRamaphosa;
        });
  }
}
