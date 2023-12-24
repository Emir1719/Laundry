import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/user.dart';
import 'package:laundry/service/firebase_auth_service.dart';
import 'package:laundry/view/home.dart';

class AuthController extends GetxController {
  var email = "".obs;
  var password = "".obs;
  var name = "".obs;
  final registerFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  final auth = locator<FirebaseAuthService>();

  void register() async {
    if (registerFormKey.currentState!.validate()) {
      registerFormKey.currentState!.save();
      AppUser? user = await auth.register(email.value, password.value);
      if (user != null) {
        Get.to(const HomeView(), popGesture: false);
      }
    } else {
      //hata
    }
  }

  void login() async {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      AppUser? user = await auth.signIn(email.value, password.value);
      if (user != null) {
        Get.to(const HomeView(), popGesture: false);
      }
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
