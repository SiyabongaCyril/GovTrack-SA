import 'widget_barrel.dart';

// All screens should use this widget as their parent
// Screen content wrapped in a safe area
// The unsafe area is a preferrred color, black by default & if not provided)
class StatusBarContainer extends StatelessWidget {
  final Widget widget;
  final Color color;
  const StatusBarContainer(
      {super.key, required this.widget, this.color = black});

  @override
  Widget build(BuildContext context) {
    changeAppColors(context);
    return Container(
      color: color,
      child: SafeArea(
        child: widget,
      ),
    );
  }
}
