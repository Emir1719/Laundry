import 'package:get/get.dart';
import 'package:laundry/constant/snackbar_message.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/announcement.dart';
import 'package:laundry/service/database_repository.dart';
import 'package:laundry/widget/loading_bar.dart';

class AnnouncementController extends GetxController {
  List<Announcement> announcements = [];
  final repository = locator<DatabaseRepository>();
  String title = "", content = "";

  Future<List<Announcement>> getAllData() async {
    try {
      announcements = [];
      announcements.addAll(await repository.getAnnouncements());
      update(); // GetX'e durumu güncellediğimizi bildiriyoruz.
      return announcements;
    } catch (e) {
      return announcements;
    }
  }

  Announcement getFirstData() {
    return announcements.first;
  }

  void setTitle(String value) {
    title = value;
  }

  void setContent(String value) {
    content = value;
  }

  void publish() async {
    if (title.trim().isNotEmpty && content.trim().isNotEmpty) {
      LoadingBar.open();
      Announcement announ = Announcement();
      announ.title = title;
      announ.content = content;
      announ.date = DateTime.now();
      bool result = await repository.saveAnnouncement(announ);
      if (result) {
        AppMessage.show(title: "Duyuru Yayınlandı", message: "Bütün kullanıcılara bildirim gönderilecek");
      } else {
        AppMessage.show(
          title: "Duyuru Yayınlanamadı",
          message: "İnternet bağlantınızı vb. kontrol ediniz",
          type: Type.error,
        );
      }
      LoadingBar.close();
    } else {
      AppMessage.show(
        title: "Boş Duyuru Gönderilemez",
        message: "Başlık ve içerik alanlarının dolu olması lazım",
        type: Type.warning,
      );
    }
  }
}
