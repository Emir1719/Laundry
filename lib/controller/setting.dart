import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/user.dart';
import 'package:laundry/service/database_repository.dart';
import 'package:laundry/widget/loading_bar.dart';

class SettingController extends GetxController {
  var name = TextEditingController(), mail = TextEditingController(), password = TextEditingController();
  final _repository = locator<DatabaseRepository>();

  SettingController() {
    getValues();
  }

  Future<void> getValues() async {
    AppUser? user = await _repository.currentUser();
    if (user == null) {
      return;
    }
    LoadingBar.open();
    name.text = user.name;
    mail.text = user.email;
    LoadingBar.close();
  }

  void onTab() {
    print(name.text);
  }
}
