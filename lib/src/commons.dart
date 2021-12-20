import 'package:flutter/material.dart';

class Commons {
  Widget compoundTitle({
    required BuildContext context,
    required String title,
    Icon? icon = const Icon(Icons.home),
    TextStyle? style,
    int? level = 3,
  }) {
    Widget backBtn = const SizedBox.shrink();
    if (ModalRoute.of(context)!.canPop) {
      backBtn = const BackButton();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        backBtn,
        GestureDetector(
          child: icon,
          onTap: () {
            int _level = level!;
            Navigator.popUntil(context, (route) => _level-- == 1);
          },
        ),
        Expanded(
          child: Center(
              child: Text(title, style: style)), //tr('General.All Defects')
        ),
      ],
    );
  }
}
