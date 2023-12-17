import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var email = "".obs;
  var password = "".obs;
  var name = "".obs;
  final registerFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();

  void register() async {
    if (registerFormKey.currentState!.validate()) {
      registerFormKey.currentState!.save();
      /*Student? student = await repository.register(email.value, password.value);
      if (student != null) {
        Get.to(const PageContainer(), popGesture: false);
      }*/
    } else {
      //hata
    }
  }

  void login() async {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
    } else {
      //hata
    }
  }

  String? emailValidator(String? value) {
    if (value!.isNotEmpty) {
      if (GetUtils.isEmail(value)) {
        return null;
      }
      return "Geçersiz email";
    }
    return "Lütfen email giriniz";
  }

  String? nameValidator(String? value) {
    if (value!.isNotEmpty) {}
    return "Lütfen email giriniz";
  }

  String? passwordValidator(String? value) {
    if (value!.isNotEmpty) {
      if (value.length > 6) {
        return null;
      }
      return "Şifre 6 karakterden uzun olmalı";
    }
    return "Lütfen şifre giriniz";
  }
}
