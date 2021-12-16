import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class PermissionsFlushbar extends StatelessWidget {
  final String title;
  final String message;
  final Duration duration;
  final IconData iconData;
  final TextButton? actionButton;

  const PermissionsFlushbar({
    Key? key,
    required BuildContext context,
    this.title = "",
    this.message = "",
    this.duration = const Duration(seconds: 3),
    this.iconData = Icons.warning,
    this.actionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Flushbar<bool>? flush;
    flush = Flushbar<bool>(
      margin: const EdgeInsets.all(8),
      titleText:
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      messageText: Text(message),
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
        visible: actionButton != null,
        child: actionButton!,
      ),
    );
    return flush;
  }
}
