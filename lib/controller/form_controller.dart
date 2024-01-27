import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/snackbar_message.dart';
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
  var isValueLoaded = false.obs;

  FormController() {
    getValues();
  }

  Future<void> getValues() async {
    LoadingBar.open();
    AppUser? user = await _repository.currentUser();
    if (user == null) {
      LoadingBar.close();
      return;
    }
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
      isValueLoaded.value = true;
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
      }
    } catch (e) {
      print(e);
    }
  }
}
