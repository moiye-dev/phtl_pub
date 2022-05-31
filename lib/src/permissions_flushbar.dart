import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

typedef Callback = Function(bool?);
typedef StatusChangeCallback = Function(FlushbarStatus?);
noop(bool? b) {}

class PermissionsFlushbar {
  static void display({
    Key? key,
    required BuildContext context,
    Color? backgroundColor,
    String? title = "",
    String? message = "",
    Duration? duration = const Duration(seconds: 3),
    IconData? iconData = Icons.warning,
    String? buttonText = "",
    Callback? onClick = noop,
    StatusChangeCallback? statusChangeCallback,
  }) {
    backgroundColor ??= Theme.of(context).cardColor;
    Flushbar<bool>? flushbar;

    flushbar = Flushbar<bool>(
      margin: const EdgeInsets.all(8),
      titleText:
          Text(title!, style: const TextStyle(fontWeight: FontWeight.bold)),
      messageText: Text(message!),
      icon: Icon(
        iconData,
        size: 28.0,
        color: Colors.red[300],
      ),
      onStatusChanged: statusChangeCallback,
      duration: duration,
      leftBarIndicatorColor: Colors.red[300],
      backgroundColor: backgroundColor,
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      mainButton: Visibility(
        visible: onClick != noop,
        child: TextButton(
          onPressed: () {
            flushbar?.dismiss(true); // result = true
          },
          child: Text(
            buttonText ?? "",
            style: const TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
    flushbar.show(context).then(onClick!);
  }
}
