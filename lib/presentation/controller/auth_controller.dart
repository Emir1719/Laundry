// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/config/route.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/domain/model/user.dart';
import 'package:laundry/domain/repository/database_repository.dart';
import 'package:laundry/presentation/widget/loading_bar.dart';

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

  void clearTexts() {
    password.value = "";
    email.value = "";
    name.value = "";
  }
}
