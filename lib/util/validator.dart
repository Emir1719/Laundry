import 'package:get/get_utils/src/get_utils/get_utils.dart';

class AppValidator {
  static final AppValidator _singleton = AppValidator._internal();

  factory AppValidator() {
    return _singleton;
  }

  AppValidator._internal();

  String? isEmail(String? value) {
    if (value!.isNotEmpty) {
      if (GetUtils.isEmail(value)) {
        return null;
      }
      return "Geçersiz email";
    }
    return "Lütfen email giriniz";
  }

  String? isPassword(String? value) {
    if (value!.isNotEmpty) {
      if (value.length > 6) {
        return null;
      }
      return "Şifre 6 karakterden uzun olmalı";
    }
    return "Lütfen şifre giriniz";
  }

  String? isNull(String? value) {
    if (value!.isNotEmpty) {
      return null;
    }
    return "Lütfen bir değer giriniz";
  }
}
