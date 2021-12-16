import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

typedef Callback = Function(bool?);

noop(bool? b) {}

class PermissionsFlushbar {
  static void display({
    Key? key,
    required BuildContext context,
    String? title = "",
    String? message = "",
    Duration? duration = const Duration(seconds: 3),
    IconData? iconData = Icons.warning,
    String? buttonText = "",
    Callback? onClick = noop,
  }) {
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
      duration: duration,
      leftBarIndicatorColor: Colors.red[300],
      backgroundColor: Theme.of(context).cardColor,
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
