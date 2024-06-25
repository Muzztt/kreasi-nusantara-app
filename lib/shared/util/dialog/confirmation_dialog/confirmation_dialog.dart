import 'package:flutter/material.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';
import 'package:kreasi_nusantara/shared/widget/step_navigation/step_navigation.dart';
import 'package:kreasi_nusantara/state_util.dart';

Future<bool> showConfirmationDialog() async {
  bool confirm = false;
  await showDialog<void>(
    context: globalContext,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Apakah data diri sudah benar?',
                  textAlign: TextAlign.center),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Background color
                  foregroundColor: secondaryTextColor, // Text color
                  side: BorderSide(color: primaryColor), // Border color
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Batal"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor, // Background color
                    foregroundColor: Colors.white // Text color
                    ),
                onPressed: () {
                  var stepNavigationController =
                      StepNavigationController.instance;
                  stepNavigationController.updateIndex(1);
                  confirm = true;
                  Navigator.pop(context);
                },
                child: const Text("Benar"),
              ),
            ],
          ),
        ],
      );
    },
  );

  return Future.value(confirm);
}
