import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:laundry/domain/model/user.dart';
import 'package:laundry/presentation/controller/user_controller.dart';
import 'package:laundry/util/constant/app_message.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/domain/repository/database_repository.dart';
import 'package:laundry/util/constant/string.dart';

class NotificationController extends GetxController {
  late final FirebaseMessaging messaging;
  final repo = locator<DatabaseRepository>();
  final _string = AppString();
  AppUser? _user;

  @override
  void onInit() {
    super.onInit();
    connect();
    setupInteractedMessage();
    _user = UserController.call.user;
    listenNoti();
  }

  void setting() async {
    await messaging.requestPermission(alert: true, badge: true, sound: true);
  }

  void connect() async {
    messaging = FirebaseMessaging.instance;
    messaging.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
    setting();
    messaging.getToken().then((value) {
      repo.saveToken(value ?? "");
    });
  }

  void listenNoti() {
    var isListening = true;
    if (isListening) {
      if (!(_user?.isAdmin ?? true)) {
        FirebaseMessaging.onMessage.listen((RemoteMessage event) {
          AppMessage.showAlertDialogDone(
            context: Get.context!,
            title: event.notification!.title!,
            message: event.notification!.body!,
            onDone: () {},
          );
          // Dinleme işlemini sonlandır
          FirebaseMessaging.onMessage.drain();
          isListening = false;
        });
      }
    }
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
    String serverKey = _string.serverKey;

    final Uri uri = Uri.parse(_string.notificationUrl);

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

    if (response.statusCode != 200) {
      AppMessage.show(title: "Hata", message: response.reasonPhrase ?? "", type: Type.error);
    }
  }

  void sendNotifications({required List<String> tokens, required String title, required String body}) async {
    String serverKey = _string.serverKey;

    final Uri uri = Uri.parse(_string.notificationUrl);

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    };

    var tokenss = tokens.map((token) => token).toList();

    final http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonEncode({
        'registration_ids': tokenss, // Use 'registration_ids' for multiple tokens
        'data': {'via': 'FlutterFire Cloud Messaging!!!', 'count': 1},
        'notification': {
          'title': title.trim(),
          'body': body.trim(),
        },
      }),
    );

    if (response.statusCode != 200) {
      AppMessage.show(title: "Hata", message: response.reasonPhrase ?? "", type: Type.error);
    }
  }
}
