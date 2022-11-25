// import 'dart:developer';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:women_safety_app/services/notification_methods.dart';

class ListenToNotificationStream {
  static void createdStream() {
    AwesomeNotifications().createdStream.listen((receivedNotification) {
      // log('created. finished: ' + receivedNotification.payload.values.toString());
    });
  }

  static void displayedStream() {
    AwesomeNotifications().displayedStream.listen((receivedNotification) {
      // log('displayed: finished: ' + receivedNotification.payload.values.toString());
    });
  }

  static void actionStream() {
    AwesomeNotifications().actionStream.listen((receivedNotification) {
      // log('actions. finished: ' + receivedNotification.payload.values.toString());
      // log('actions. finished: ' + receivedNotification.buttonKeyPressed.toString());

      if (receivedNotification.buttonKeyPressed == 'START') {
        //PRESSED SEND SOS
        NotificationMethods.showProgressNotification(1337);
      } else if (receivedNotification.buttonKeyPressed == 'STOP') {
        //PRESSED CANCEL
        NotificationMethods.cancelProgressNotification();
      }
    });
  }

  static void dismissedStream() {
    AwesomeNotifications().dismissedStream.listen((receivedNotification) {
      String dismissedSourceText = AssertUtils.toSimpleEnumString(
          receivedNotification.dismissedLifeCycle);
      Fluttertoast.showToast(
          msg: 'Notification dismissed on $dismissedSourceText');
    });
  }
}
