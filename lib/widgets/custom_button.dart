import 'widget_barrel.dart';

// Elevated button with custom styling : Used for login, signup,
// get started buttons and more
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color = navyBlue,
    required this.text,
    this.textColor = Colors.white,
    this.borderColor = navyBlue,
    required this.onPressed,
    this.addButtonShadow = false,
  });

  final String text;
  final bool addButtonShadow;
  final void Function() onPressed;
  final Color color, textColor, borderColor;

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
