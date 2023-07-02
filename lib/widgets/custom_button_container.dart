import 'widget_barrel.dart';

// Small custom application button. Used throughout the application
// "Is an elevated button wrapped with a container for styling"
class CustomButtonContainer extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final Color borderColor;
  final void Function() onPressed;
  final bool addButtonShadow;

  const CustomButtonContainer({
    super.key,
    this.color = navyBlue,
    required this.text,
    this.textColor = Colors.white,
    this.borderColor = navyBlue,
    required this.onPressed,
    this.addButtonShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    changeAppColors(context);
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: proportionalWidth(screenWidth, 120),
      height: proportionalHeight(screenHeight, 25),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        color: color,
        boxShadow: [
          addButtonShadow
              ? const BoxShadow(
                  color: black,
                  offset: Offset(-1, 2),
                  blurRadius: 0.1,
                )
              : const BoxShadow(
                  color: transparent,
                  offset: Offset(0, 0),
                  blurRadius: 0,
                )
        ],
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(transparent),
            shadowColor: MaterialStateProperty.all(transparent),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: proportionalHeight(screenHeight, 13),
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
