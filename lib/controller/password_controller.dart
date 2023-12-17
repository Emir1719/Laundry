import 'package:get/get.dart';

class PasswordController extends GetxController {
  var obscure = false.obs;

  void toggle() {
    if (obscure.value) {
      obscure.value = false;
    } else {
      obscure.value = true;
    }
  }
}
