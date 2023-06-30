// ERROR DIALOG METHODS
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gov_track_sa/widgets/custom_button_container.dart';
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
        content: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: proportionalWidth(deviceWidth, 100),
                height: proportionalHeight(deviceHeight, 25),
                child: CustomButtonContainer(
                  text: "No",
                  onPressed: () {
                    //close dialog
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SizedBox(
                width: proportionalWidth(deviceWidth, 100),
                height: proportionalHeight(deviceHeight, 25),
                child: CustomButtonContainer(
                  text: "Yes",
                  onPressed: () async {
                    await AppAuth.auth.logOut(context: context).then((value) {
                      log("Logged out successfully");
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
