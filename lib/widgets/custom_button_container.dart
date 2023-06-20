import 'package:flutter/material.dart';
import '/utilities/dimension_methods.dart';
import '/utilities/app_colors.dart';

// class CustomButtonContainer extends StatelessWidget {
//   final Color color;
//   final Color textColor;
//   final String text;
//   final Color borderColor;
//   const CustomButtonContainer({
//     super.key,
//     this.color = navyBlue,
//     required this.text,
//     this.textColor = white,
//     this.borderColor = navyBlue,
//   });

//   @override
//   Widget build(BuildContext context) {
//     double statusBarHeight = MediaQuery.of(context).padding.top;
//     double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Container(
//       width: proportionalWidth(screenWidth, 131),
//       height: proportionalHeight(screenHeight, 33),
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(
//           Radius.circular(50),
//         ),
//         color: color,
//         border: Border.all(
//           color: borderColor,
//         ),
//       ),
//       child: Center(
//         child: Text(
//           text,
//           style: TextStyle(
//             color: textColor,
//             fontSize: proportionalHeight(screenHeight, 16),
//           ),
//         ),
//       ),
//     );
//   }
// }

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
              shadowColor: MaterialStatePropertyAll(Colors.transparent),
              backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: proportionalHeight(screenHeight, 16),
            ),
          ),
        ),
      ),
    );
  }
}
