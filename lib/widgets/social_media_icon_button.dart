// Social Media IconButton
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widget_barrel.dart';

class SocialMediaIconButton extends StatelessWidget {
  const SocialMediaIconButton({
    super.key,
    required this.iconData,
    this.color = black,
    required this.onPressed,
  });
  final IconData iconData;
  final Color color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: FaIcon(
            iconData,
            color: color,
            size: proportionalWidth(screenWidth, 20),
          ),
        ),
      ],
    );
  }
}
