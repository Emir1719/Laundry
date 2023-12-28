import 'package:get/get.dart';

class PasswordController extends GetxController {
  var obscure = true.obs;

  void toggle() {
    if (obscure.value) {
      obscure.value = false;
    } else {
      obscure.value = true;
    }
  }
}
