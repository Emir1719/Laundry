import 'package:get/get.dart';
import 'package:laundry/constant/route.dart';
import 'package:laundry/constant/app_message.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/service/firebase_auth_service.dart';

class SignOutController extends GetxController {
  final auth = locator<FirebaseAuthService>();

  void onTab() async {
    try {
      AppMessage.showAlertDialog(
        context: Get.context!,
        title: "Çıkmak istediğinize emin misiniz?",
        message: "Giriş yapana kadar bildirim almayacaksınız",
        onSuccess: () async {
          bool result = await auth.signOut();
          if (result) {
            // Burada kullanılan (route) => false ifadesi, Get.offNamedUntil fonksiyonunun
            // geçmişteki rotaları temizlemesini sağlar. Yani, bu sayede kayıt sayfasına
            // geçtikten sonra geri dönülebilecek bir geçmiş oluşmaz.
            Get.offNamedUntil(AppRoute.register, (route) => false);
          }
        },
      );
    } catch (e) {
      print("hata: $e");
    }
  }
}
