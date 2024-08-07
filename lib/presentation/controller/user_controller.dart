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
  void onInit() async {
    super.onInit();
    await load();
  }

  Future<void> load() async {
    user = await _repository.currentUser();
    route();
  }

  void route() {
    if (user != null) {
      Get.offAllNamed(AppRoute.home);
    } else {
      Get.offAllNamed(AppRoute.register);
    }
  }
}
