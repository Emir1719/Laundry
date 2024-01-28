import 'package:get/get.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/announcement.dart';
import 'package:laundry/service/database_repository.dart';

class AnnouncementController extends GetxController {
  List<Announcement> announcements = [];
  final repository = locator<DatabaseRepository>();

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
}
