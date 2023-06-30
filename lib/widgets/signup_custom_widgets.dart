import 'widget_barrel.dart';

// Container for signup/login screen fields:
// fields: password textfield, signup-options Field, email&phone number fields
class SignupFieldContainer extends StatelessWidget {
  final Color containerColor;

  const SignupFieldContainer({
    super.key,
    required this.widget,
    this.containerColor = white,
  });
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        padding: EdgeInsets.only(
          left: proportionalWidth(screenWidth, 15),
          right: proportionalWidth(screenWidth, 5),
          top: proportionalHeight(screenHeight, 10),
          bottom: proportionalHeight(screenHeight, 10),
        ),
        alignment: Alignment.topCenter,
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
            height: proportionalHeight(screenHeight, 20),
            width: proportionalWidth(screenWidth, 20),
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

//Defines all textfields for signing up and logging in
class SignupLoginTextField extends StatelessWidget {
  final String headingText;
  final String hintText;
  final String errorText;
  final Widget? suffixWidget;
  final Function(String)? onTextFieldChanged;
  final TextInputType? keyboardType;

  final TextEditingController textFieldController;
  const SignupLoginTextField({
    super.key,
    this.hintText = "",
    required this.headingText,
    required this.textFieldController,
    this.errorText = "",
    this.suffixWidget,
    this.onTextFieldChanged,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    return Column(
      children: [
        // Text Field Heading
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            headingText,
            style: const TextStyle(
              fontSize: 17,
              fontFamily: "Inter",
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        SizedBox(
          height: proportionalHeight(screenHeight, 7),
        ),
        // Bordered Text Field
        SignupFieldContainer(
          widget: TextField(
            keyboardType: keyboardType,
            onChanged: onTextFieldChanged,
            controller: textFieldController,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: "Inter",
              fontWeight: FontWeight.w300,
              color: navyBlue,
            ),
            textAlign: TextAlign.justify,
            decoration: InputDecoration(
              suffixIcon: suffixWidget,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                bottom: proportionalHeight(screenHeight, 13),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                fontFamily: "Inter",
                fontWeight: FontWeight.w300,
                color: black.withOpacity(0.2),
              ),
            ),
          ),
        ),
        //Text showing error in textfield
        Padding(
          padding: EdgeInsets.only(
            right: proportionalWidth(screenHeight, 5),
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              errorText,
              style: const TextStyle(
                color: navyBlue,
                fontStyle: FontStyle.italic,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
