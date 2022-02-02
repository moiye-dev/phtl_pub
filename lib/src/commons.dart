import 'package:flutter/material.dart';

class Commons {
  Widget compoundTitle({
    required BuildContext context,
    required String title,
    String? subTitle,
    Icon? icon = const Icon(Icons.home),
    TextStyle? style,
    TextStyle? subTitleStyle =
        const TextStyle(color: Colors.white, fontSize: 14),
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
        subTitle == null
            ? Expanded(
                child: Center(child: Text(title, style: style)),
              )
            : Expanded(
                child: Column(
                  children: [
                    Center(
                      child: Text(title, style: style),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Center(
                      child: Text(subTitle,
                          overflow: TextOverflow.ellipsis,
                          style: subTitleStyle),
                    ),
                  ],
                ),
              ),
      ],
    );
  }

  static final Commons _instance = Commons._internal();
  factory Commons() {
    return _instance;
  }
  Commons._internal();
}
