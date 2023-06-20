import 'package:flutter/material.dart';
import 'package:gov_track_sa/utilities/app_colors.dart';
import '/utilities/dimension_methods.dart';

enum CircleColors { white, orange }

class WalkthroughPageCircle extends StatelessWidget {
  final CircleColors circleColor;
  const WalkthroughPageCircle(
      {super.key, this.circleColor = CircleColors.white});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(width: proportionalWidth(screenWidth, 7)),
        Container(
          width: proportionalWidth(screenWidth, 12),
          height: proportionalHeight(screenHeight, 12),
          decoration: BoxDecoration(
            border: const Border.fromBorderSide(
                BorderSide(strokeAlign: BorderSide.strokeAlignOutside)),
            shape: BoxShape.circle,
            color: circleColor == CircleColors.white ? white : orange,
          ),
        ),
      ],
    );
  }
}
