// ignore_for_file: avoid_print

import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Helpers {
  static final Helpers _instance = Helpers._internal();

  factory Helpers() {
    return _instance;
  }

  Future<void> initPlatformState() async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    String? appId = dotenv.env['AppId'];
    print("appId=$appId");
    await OneSignal.shared.setAppId(appId ?? "");

    //iOS requires users consent for notifications
    // Android devices are subscribed to notifications automatically when your app is installed,
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      OneSignal.shared.getDeviceState().then((deviceState) {
        if (deviceState != null) {
          //@TODO
          // print("PlayerId=" + deviceState.userId!);
          // print("Push Disabled=${deviceState.pushDisabled}");
        }
      });
    });
  }

  void setExternalUser(String externalUserId) {
    OneSignal.shared
        .setExternalUserId(externalUserId)
        .then((results) {})
        .catchError((error) {});
  }

  Helpers._internal();
}
