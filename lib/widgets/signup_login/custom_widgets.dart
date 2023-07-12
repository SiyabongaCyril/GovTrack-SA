import '../../utilities/enums.dart';
import '../../utilities/navigators.dart';
import '../custom_button.dart';
import '../../utilities/helper_variables.dart';

import '../widget_barrel.dart';

// Container for signup/login screen fields:
// fields: password textfield, signup-options Field, email&phone number fields
class SignupFieldContainer extends StatelessWidget {
  final Color containerColor;

  const SignupFieldContainer({
    super.key,
    required this.widget,
    this.containerColor = Colors.white,
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
        height: proportionalHeight(screenHeight, 45),
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
// email, phone and other
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
                fontSize: proportionalHeight(screenHeight, 13),
                color: //dark navy blue
                    black,
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
  final bool obscureText;

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
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
    //double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        // Text Field Heading
        Padding(
          padding: EdgeInsets.only(
            left: proportionalWidth(screenHeight, 5),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              headingText,
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w300, color: black),
            ),
          ),
        ),
        SizedBox(
          height: proportionalHeight(screenHeight, 7),
        ),
        // Bordered Text Field
        SignupFieldContainer(
          containerColor: white,
          widget: TextField(
            obscureText: obscureText,
            keyboardType: keyboardType,
            onChanged: onTextFieldChanged,
            controller: textFieldController,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: navyBlue,
            ),
            textAlign: TextAlign.justify,
            decoration: InputDecoration(
              // suffixIconConstraints: BoxConstraints(
              //     //maxHeight: proportionalHeight(screenHeight, 20),
              //     //maxWidth: proportionalWidth(screenWidth, ),
              //     ),
              suffixIcon: suffixWidget,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                bottom: proportionalHeight(screenHeight, 12),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                color: black.withOpacity(0.2),
              ),
            ),
          ),
        ),
        //Text showing error in textfield if there's any
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

// Defines the icon for signup options:
class SignupOptionIcon extends StatelessWidget {
  const SignupOptionIcon({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: black,
      size: 20,
      shadows: const [
        Shadow(
          color: black,
          blurRadius: 2,
          offset: Offset(0, 0),
        ),
      ],
    );
  }
}

// button to navigate to login screen
class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.buttonType});
  final ButtonType buttonType;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: CustomButton(
        onPressed: () {
          // navigate to login screen if I am not already
          // on the login screen
          bool isLoginRoute = ModalRoute.of(context)?.settings.name == login;

          if (isLoginRoute) {
            return;
          } else {
            currentSignupPage = login;
            navigateToRouteAndPop(context, login, signup);
          }
        },
        text: "Login",
        color: buttonType == ButtonType.login ? black : white,
        textColor: buttonType == ButtonType.login ? white : black,
        borderColor: black,
      ),
    );
  }
}

// button to navigate to signup screen
class SignupButton extends StatelessWidget {
  const SignupButton({super.key, required this.buttonType});
  final ButtonType buttonType;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: CustomButton(
        onPressed: () {
          // navigate to signup screen if I am not already
          // on the signup screen
          bool isSignupRoute = ModalRoute.of(context)?.settings.name == signup;

          if (isSignupRoute) {
            return;
          } else {
            currentSignupPage = signup;
            navigateToRouteAndPop(context, lastSignUpScreen, login);
          }
        },
        text: "Sign-up",
        color: buttonType == ButtonType.login ? white : black,
        textColor: buttonType == ButtonType.login ? black : white,
        borderColor: black,
      ),
    );
  }
}
