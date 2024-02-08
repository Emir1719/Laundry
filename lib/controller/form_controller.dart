import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/app_message.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/note.dart';
import 'package:laundry/model/user.dart';
import 'package:laundry/service/database_repository.dart';
import 'package:laundry/widget/loading_bar.dart';

class FormController extends GetxController {
  var note = Note().obs;
  var fileNo = TextEditingController(),
      degree = TextEditingController(),
      mode = TextEditingController(),
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
      setFileNo(fileNo.text);
      setComment(comment.text);
      setDegree(degree.text);
      setMode(mode.text);
    }
    LoadingBar.close();
  }

  @override
  void dispose() {
    super.dispose();
    fileNo.dispose();
    degree.dispose();
    mode.dispose();
    comment.dispose();
  }

  void setFileNo(String value) {
    note.value.fileNo = value;
  }

  void setDegree(String value) {
    note.value.degree = value;
  }

  void setMode(String value) {
    note.value.mode = value;
  }

  void setComment(String value) {
    note.value.comment = value;
  }

  void onTab() async {
    try {
      if (note.value.fileNo.isNotEmpty && note.value.degree.isNotEmpty && note.value.mode.isNotEmpty) {
        bool result = await _repository.saveNote(note.value);
        if (result) {
          AppMessage.show(title: "İşlem Başarılı", message: "Kıyafetleriniz Sıraya Alınmıştır.");
        }
      } else {
        AppMessage.show(title: "İlk üç alanı lütfen doldurun", message: "Bazı alanlar zorunlu");
      }
    } catch (e) {
      print(e);
    }
  }
}
