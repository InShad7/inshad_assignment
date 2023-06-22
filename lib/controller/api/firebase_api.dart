import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:viva/main.dart';
import 'package:viva/view/notification_screen/notification_screen.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fToken = await _firebaseMessaging.getToken();
    print('Token:  ${fToken}');

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    initPushNotification();
  }
}

Future<void> handleBackgroundMessage(RemoteMessage msg) async {
  print('Title: ${msg.notification?.title}');
  print('Body: ${msg.notification?.body}');
  print('Payload : ${msg.data}');
}

void handleMessage(RemoteMessage? msg) {
  if (msg == null) return;

  navigatorKey.currentState
      ?.pushNamed(NotificationScreen.route, arguments: msg);
}

Future initPushNotification() async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.instance.getInitialMessage().then((value) => handleMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
}
