import 'package:get/get.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/config/route.dart';
import 'package:laundry/domain/model/user.dart';
import 'package:laundry/domain/repository/database_repository.dart';

class UserController extends GetxController {
  AppUser? user;
  final _repository = locator<DatabaseRepository>();

  static UserController get call => Get.find();

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  void _load() async {
    user = await _repository.currentUser();
    if (user != null) {
      Get.offAllNamed(AppRoute.home);
    }
  }
}
