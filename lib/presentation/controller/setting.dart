import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/domain/model/user.dart';
import 'package:laundry/domain/repository/database_repository.dart';
import 'package:laundry/presentation/widget/loading_bar.dart';
import 'package:laundry/util/constant/app_message.dart';

class SettingController extends GetxController {
  var name = TextEditingController(), mail = TextEditingController(), password = TextEditingController();
  final _repository = locator<DatabaseRepository>();
  AppUser? user;

  SettingController() {
    getValues();
  }

  Future<void> getValues() async {
    await _repository.currentUser().then((value) => user = value);
    if (user == null) {
      return;
    }
    LoadingBar.open();
    name.text = user!.name;
    mail.text = user!.email;
    LoadingBar.close();
  }

  void onTab() async {
    Map<String, dynamic> map = {};
    map["name"] = name.text.trim();

    AppMessage.showAlertDialog(
      context: Get.context!,
      title: "Emin misiniz?",
      message: "İsminiz ${name.text} olarak değiştirilecek. Onaylıyor musunuz? Daha sonra tekrar değiştirebilirsiniz.",
      onSuccess: () async {
        LoadingBar.open();
        await _repository.updateUser(map);
        LoadingBar.close();
      },
    );
  }
}
