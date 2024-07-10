import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/util/constant/app_message.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/domain/model/note.dart';
import 'package:laundry/domain/model/user.dart';
import 'package:laundry/domain/repository/database_repository.dart';
import 'package:laundry/presentation/widget/loading_bar.dart';

class FormController extends GetxController {
  var note = Note().obs;
  var fileNo = TextEditingController(),
      degree = TextEditingController(),
      mode = TextEditingController(),
      modeDry = TextEditingController(),
      comment = TextEditingController();
  final _repository = locator<DatabaseRepository>();

  FormController() {
    getValues();
  }

  Future<void> getValues() async {
    AppUser? user = await _repository.currentUser();
    if (user == null) {
      return;
    }
    LoadingBar.open();
    Note? note = await _repository.getNote(user.id);
    if (note != null) {
      fileNo.text = note.fileNo;
      degree.text = note.degree;
      comment.text = note.comment;
      mode.text = note.mode;
      modeDry.text = note.modeDry;
    }
    LoadingBar.close();
  }

  void saveValues() {
    note.value.fileNo = fileNo.text;
    note.value.comment = comment.text;
    note.value.degree = degree.text;
    note.value.mode = mode.text;
    note.value.modeDry = modeDry.text;
  }

  @override
  void dispose() {
    super.dispose();
    fileNo.dispose();
    degree.dispose();
    mode.dispose();
    comment.dispose();
  }

  void onTab() async {
    try {
      saveValues();

      if (note.value.fileNo.isNotEmpty && note.value.degree.isNotEmpty && note.value.mode.isNotEmpty) {
        bool result = await _repository.saveNote(note.value);
        if (result) {
          AppMessage.show(title: "İşlem Başarılı", message: "Kıyafetleriniz Sıraya Alınmıştır.");
        }
      } else {
        AppMessage.show(title: "İlk üç alanı lütfen doldurun", message: "Bazı alanlar zorunlu");
      }
    } catch (e) {
      AppMessage.show(title: "Hata", message: e.toString(), type: Type.error);
    }
  }
}
