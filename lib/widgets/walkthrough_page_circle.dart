import 'package:flutter/material.dart';
import '/utilities/dimension_methods.dart';

class WalkthroughPageCircle extends StatefulWidget {
  final Color circleColor;
  const WalkthroughPageCircle({super.key, required this.circleColor});

  @override
  State<WalkthroughPageCircle> createState() => _WalkthroughPageCircleState();
}

class _WalkthroughPageCircleState extends State<WalkthroughPageCircle> {
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
            color: widget.circleColor,
          ),
        ),
      ],
    );
  }
}
