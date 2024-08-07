import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:laundry/util/constant/app_message.dart';

class AuthValidator extends GetxController {
  static void getMessageAuth(FirebaseAuthException error) {
    String errorMessage = "";

    switch (error.code) {
      case "invalid-email":
        errorMessage = "Geçersiz email formatı";
        break;
      case "wrong-password":
        errorMessage = "Hatalı şifre";
        break;
      case "user-not-found":
        errorMessage = "Kullanıcı bulunamadı";
        break;
      case "user-disabled":
        errorMessage = "Bu hesap bloke olmuştur. Yeni hesap oluşturun";
        break;
      case 'email-already-in-use':
        errorMessage = 'Bu email başkası tarafından kullanılıyor';
      case 'operation-not-allowed':
        errorMessage = 'İşlem engellendi';
      case 'weak-password':
        errorMessage = 'Parola çok zayıf';
      default:
        errorMessage = "Bilinmeyen bir hata oluştu";
    }

    AppMessage.show(title: errorMessage, message: "Hata", type: Type.error);
  }
}
