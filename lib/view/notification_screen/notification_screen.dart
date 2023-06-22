import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  static const route = '/notification_screen';

  @override
  Widget build(BuildContext context) {
    final msg = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Notification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${msg.notification?.title}',
                style: const TextStyle(fontSize: 20)),
            Text('${msg.notification?.body}',
                style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
