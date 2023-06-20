import 'package:flutter/material.dart';
import 'package:gov_track_sa/utilities/app_colors.dart';

//All screens should use this widget as their parent
//Screen content wrapped in a safe area
//The unsafe area is of a black color (AppBar will always be black)
class StatusBarContainer extends StatelessWidget {
  final Widget widget;
  final Color color;
  const StatusBarContainer(
      {super.key, required this.widget, this.color = black});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: SafeArea(
        child: widget,
      ),
    );
  }
}
