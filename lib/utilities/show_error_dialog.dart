// ERROR DIALOG METHODS
import 'package:flutter/material.dart';
import 'package:gov_track_sa/widgets/custom_button.dart';
import 'app_colors.dart';
import 'dimension_methods.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
  String title,
  void Function() onPressed,
) {
  double statusBarHeight = MediaQuery.of(context).padding.top;
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height - statusBarHeight;
  return showDialog(
    useSafeArea: true,
    context: context,
    builder: (context) {
      return AlertDialog(
        alignment: AlignmentDirectional.bottomCenter,
        backgroundColor: white,
        actionsPadding: const EdgeInsets.all(20),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: black,
          ),
        ),
        shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          1,
        ),
        content: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: black,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: proportionalWidth(deviceWidth, 70),
                height: proportionalHeight(deviceHeight, 25),
                child: CustomButton(
                  textColor: white,
                  text: "No",
                  onPressed: () {
                    //close dialog
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SizedBox(
                width: proportionalWidth(deviceWidth, 70),
                height: proportionalHeight(deviceHeight, 25),
                child: CustomButton(
                  textColor: white,
                  text: "Yes",
                  onPressed: onPressed,
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
