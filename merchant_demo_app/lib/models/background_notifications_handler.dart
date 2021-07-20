import 'package:firebase_messaging/firebase_messaging.dart';

//receive message when app is in background
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}
