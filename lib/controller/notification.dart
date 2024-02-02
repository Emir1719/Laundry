import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NotificationController extends GetxController {
  late final FirebaseMessaging messaging;

  @override
  void onInit() {
    super.onInit();
    connect();
    setupInteractedMessage();
    listenNoti();
  }

  void setting() async {
    await messaging.requestPermission(alert: true, badge: true, sound: true);
  }

  void connect() async {
    messaging = FirebaseMessaging.instance;
    messaging.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
    setting();
    messaging.getToken().then((value) => print("token: $value"));
  }

  void listenNoti() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Bildirim alındı: ${message.notification?.title}');
      /*sendNotification(
        token:
            "e7s3AzSLQMGirkrMW2zPpE:APA91bFwiIG7irmWxEpWZh-d18utBAX9ZJ1NgEv9y5ttvQ0Np4g4KSgj2IOR-tLjW8bUAd25SwHooCQZCATstqBQbYqsYgWZa07ypzKULjww6w_5OMViK7u9NjhoP28xIKXnPI6R9Bcy",
        title: message.notification?.title ?? "Bildirim Başlık",
        body: "Lütfen çamaşırhaneye gelip kıyafetlerinizi alınız",
      );*/
    });
    //messaging.sendMessage(),
  }

  // In this example, suppose that all messages contain a data field with the key 'type'.
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    if (message.data['type'] == 'chat') {
      ///go to any page
    }
  }

  void sendNotification({required String token, required String title, required String body}) async {
    // Firebase Console'dan alınan server key'i
    const String serverKey =
        'AAAAB7vH1TY:APA91bEcVve7tP5AyCXThgH6nR0_-Ns2X4ibj03d7_-r8t57PAUYY1L5-PQ_4UzdkKoFgQsDbv_EjFl1LkBxqdRXinXKOFYU3sszELGj69XvdfBOQMxqiuc86IPpiSD1JeSfF47iRqbx';

    final Uri uri = Uri.parse('https://fcm.googleapis.com/fcm/send');

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    };

    final http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonEncode({
        'to': token.trim(),
        'data': {'via': 'FlutterFire Cloud Messaging!!!', 'count': 1},
        'notification': {
          'title': title.trim(),
          'body': body.trim(),
        },
      }),
    );

    if (response.statusCode == 200) {
      print('Bildirim gönderildi: ${response.body}');
    } else {
      print('Bildirim gönderme hatası: ${response.reasonPhrase}');
    }
  }
}
