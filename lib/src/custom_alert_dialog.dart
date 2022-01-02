import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String message;
  final String positiveBtnText;
  final String negativeBtnText;
  final Function onPostivePressed;
  final Function onNegativePressed;
  final double circularBorderRadius;
  static _ok() {}
  static _cancel() {}

  const CustomAlertDialog({
    Key? key,
    this.title = "",
    this.message = "",
    this.circularBorderRadius = 15.0,
    this.bgColor = Colors.white,
    this.positiveBtnText = "OK",
    this.negativeBtnText = "Cancel",
    this.onPostivePressed = _ok,
    this.onNegativePressed = _cancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius)),
      actions: <Widget>[
        ElevatedButton(
          child: Text(negativeBtnText,
              style: const TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            primary: const ColorScheme.light().primary,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            onNegativePressed();
          },
        ),
        ElevatedButton(
          child: Text(positiveBtnText,
              style: const TextStyle(color: Colors.white)),
          onPressed: () {
            onPostivePressed();
          },
        ),
      ],
    );
  }
}
