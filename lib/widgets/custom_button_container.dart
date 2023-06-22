import 'widget_barrel.dart';

// Small custom application button. Used throughout the application
// "Is an elevated button wrapped with a container for styling"
class CustomButtonContainer extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final Color borderColor;
  final void Function() onPressed;

  const CustomButtonContainer(
      {super.key,
      this.color = navyBlue,
      required this.text,
      this.textColor = white,
      this.borderColor = navyBlue,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: proportionalWidth(screenWidth, 131),
      height: proportionalHeight(screenHeight, 33),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        color: color,
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Center(
        child: ElevatedButton(
          style: const ButtonStyle(
            shadowColor: MaterialStatePropertyAll(
              Colors.transparent,
            ),
            backgroundColor: MaterialStatePropertyAll(
              Colors.transparent,
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: proportionalHeight(screenHeight, 14),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
