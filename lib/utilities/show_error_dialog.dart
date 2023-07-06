// ERROR DIALOG METHODS
import 'package:flutter/material.dart';
import 'package:gov_track_sa/widgets/custom_button.dart';
import 'app_colors.dart';
import '../services/auth/govtracksa_auth.dart';
import 'dimension_methods.dart';
import 'navigators.dart';

Future<void> showErrorDialog(BuildContext context, String text) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;
  return showDialog(
    useSafeArea: true,
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: white,
        actionsPadding: const EdgeInsets.all(20),
        title: const Text(
          "Logout",
          style: TextStyle(
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
                  onPressed: () async {
                    await AppAuth.auth.logOut(context: context).then((value) {
                      navigatePushNamedAndRemoveUntil(context, login);
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
