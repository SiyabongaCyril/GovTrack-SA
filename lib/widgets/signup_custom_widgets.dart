import 'widget_barrel.dart';

// Container for signup/login screen fields:
// fields: password textfield, signup-options Field, email&phone number fields
class SignupFieldContainer extends StatelessWidget {
  final Color containerColor;
  const SignupFieldContainer(
      {super.key, required this.widget, this.containerColor = white});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: proportionalWidth(screenWidth, 287),
        height: proportionalHeight(screenHeight, 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1,
              color: black,
            ),
            color: containerColor),
        child: widget,
      ),
    );
  }
}

// Defines the button for signup options:
// gmail, phone and other
class SignupOptionButton extends StatelessWidget {
  const SignupOptionButton(
      {super.key, required this.text, required this.widget});
  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;

    return SignupFieldContainer(
      containerColor: grey,
      widget: Row(
        children: [
          SizedBox(
            width: proportionalWidth(screenWidth, 26),
          ),
          SizedBox(
            child: widget,
          ),
          SizedBox(
            width: proportionalWidth(screenWidth, 19),
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: proportionalHeight(screenHeight, 14),
                color: navyBlue,
                fontFamily: "Inter",
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
