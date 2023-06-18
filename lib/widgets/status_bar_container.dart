import 'package:flutter/material.dart';
import 'package:gov_track_sa/utilities/app_colors.dart';

//All screens should use this widget as their parent
//Screen content wrapped in a safe area
//The unsafe area is of a black color (AppBar will always be black)
class StatusBarContainer extends StatelessWidget {
  final Widget widget;
  const StatusBarContainer({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: black,
      child: SafeArea(
        child: widget,
      ),
    );
  }
}
