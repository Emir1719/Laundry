// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/route.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/user.dart';
import 'package:laundry/service/database_repository.dart';
import 'package:laundry/widget/loading_bar.dart';

class AuthController extends GetxController {
  var email = "".obs;
  var password = "".obs;
  var name = "".obs;
  late var registerFormKey, loginFormKey;
  final repository = locator<DatabaseRepository>();

  AuthController() {
    registerFormKey = GlobalKey<FormState>();
    loginFormKey = GlobalKey<FormState>();
  }

  void register() async {
    try {
      if (registerFormKey.currentState!.validate()) {
        registerFormKey.currentState!.save();
        LoadingBar.open();
        name.value = name.value.trim();
        AppUser? user = await repository.register(email.value.trim(), password.value.trim());
        LoadingBar.close();
        if (user != null) {
          Get.toNamed(AppRoute.home);
          clearTexts();
          return;
        }
      }
    } finally {}
  }

  void login() async {
    try {
      if (loginFormKey.currentState!.validate()) {
        loginFormKey.currentState!.save();
        LoadingBar.open();
        AppUser? user = await repository.signIn(email.value.trim(), password.value.trim());
        LoadingBar.close();
        if (user != null) {
          Get.toNamed(AppRoute.home);
          clearTexts();
          return;
        }
      }
    } finally {}
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
