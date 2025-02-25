import 'package:expense_app/Utils/color_constants.dart';
import 'package:expense_app/Utils/my_styles.dart';
import 'package:flutter/material.dart';

class AppRoundedButton extends StatelessWidget {
  VoidCallback onTap;
  String title;
  Color bgColor;
  Color textColor;
  Widget? mWidget;

  AppRoundedButton(
      {required this.onTap,
      required this.title,
      this.bgColor = ColorConstants.mattBlackColor,
      this.textColor = Colors.white,
        this.mWidget
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21))),
        onPressed: onTap,
        child:mWidget ?? Text(
          title,
          style: mTextStyle16(fontColor: textColor),
        ));
  }
}
