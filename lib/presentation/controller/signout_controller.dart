import 'package:get/get.dart';
import 'package:laundry/config/route.dart';
import 'package:laundry/presentation/controller/user_controller.dart';
import 'package:laundry/util/constant/app_message.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/domain/repository/database_repository.dart';
import 'package:laundry/domain/repository/firebase_auth_service.dart';

class SignOutController extends GetxController {
  final auth = locator<FirebaseAuthService>();
  final repo = locator<DatabaseRepository>();

  void onTab() async {
    try {
      AppMessage.showAlertDialog(
        context: Get.context!,
        title: "Çıkmak istediğinize emin misiniz?",
        message: "Giriş yapana kadar bildirim almayacaksınız",
        onSuccess: () async {
          await repo.deleteToken();
          bool result = await auth.signOut();
          if (result) {
            UserController.call.user = null;
            // Burada kullanılan (route) => false ifadesi, Get.offNamedUntil fonksiyonunun
            // geçmişteki rotaları temizlemesini sağlar. Yani, bu sayede kayıt sayfasına
            // geçtikten sonra geri dönülebilecek bir geçmiş oluşmaz.
            await Get.offNamedUntil(AppRoute.register, (route) => false);
          }
        },
      );
    } catch (e) {
      AppMessage.show(title: "Hata", message: e.toString(), type: Type.error);
    }
  }
}
