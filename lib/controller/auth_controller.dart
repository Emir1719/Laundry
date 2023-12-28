import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/user.dart';
import 'package:laundry/service/database_repository.dart';
import 'package:laundry/view/home.dart';

class AuthController extends GetxController {
  var email = "".obs;
  var password = "".obs;
  var name = "".obs;
  var isLoading = false.obs;
  final registerFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  final repository = locator<DatabaseRepository>();

  void register() async {
    try {
      if (registerFormKey.currentState!.validate()) {
        registerFormKey.currentState!.save();
        isLoading.value = true;
        AppUser? user = await repository.register(email.value, password.value);
        if (user != null) {
          Get.to(const HomeView(), popGesture: false);
          clearTexts();
        }
      }
    } finally {
      isLoading.value = false;
    }
  }

  void login() async {
    try {
      if (loginFormKey.currentState!.validate()) {
        loginFormKey.currentState!.save();
        isLoading.value = true;

        AppUser? user = await repository.signIn(email.value, password.value);
        if (user != null) {
          Get.to(const HomeView(), popGesture: false);
          clearTexts();
        }
      }
    } finally {
      isLoading.value = false;
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

  void clearTexts() {
    password.value = "";
    email.value = "";
    name.value = "";
  }
}
