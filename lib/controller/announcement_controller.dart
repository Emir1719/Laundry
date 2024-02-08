import 'package:get/get.dart';
import 'package:laundry/constant/app_message.dart';
import 'package:laundry/controller/notification.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/announcement.dart';
import 'package:laundry/service/database_repository.dart';
import 'package:laundry/widget/loading_bar.dart';

class AnnouncementController extends GetxController {
  List<Announcement> announcements = [];
  final repository = locator<DatabaseRepository>();
  String title = "", content = "";

  void setTitle(String value) {
    title = value;
  }

  void setContent(String value) {
    content = value;
  }

  void publish() async {
    setTitle(title.trim());
    setContent(content.trim());
    if (title.isNotEmpty && content.isNotEmpty) {
      LoadingBar.open();
      Announcement announ = Announcement();
      announ.title = title;
      announ.content = content;
      announ.date = DateTime.now();
      bool result = await repository.saveAnnouncement(announ);
      if (result) {
        //Bütün kullanıcılara bildirim gönderilecek
        AppMessage.show(title: "Duyuru Yayınlandı", message: "İşlem başarılı");
      } else {
        AppMessage.show(
          title: "Duyuru Yayınlanamadı",
          message: "İnternet bağlantınızı vb. kontrol ediniz",
          type: Type.error,
        );
      }
      LoadingBar.close();
      sendNoti(result);
    } else {
      AppMessage.show(
        title: "Boş Duyuru Gönderilemez",
        message: "Başlık ve içerik alanlarının dolu olması lazım",
        type: Type.warning,
      );
    }
  }

  void sendNoti(bool result) async {
    if (!result) {
      return;
    }
    final noti = Get.put(NotificationController());
    var list = await repository.getAllToken();
    noti.sendNotifications(tokens: list, title: "Yeni Duyuru: $title", body: content);
  }
}
