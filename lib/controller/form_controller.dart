import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/snackbar_message.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/note.dart';
import 'package:laundry/service/database_repository.dart';

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
    Note? note = await _repository.getNote();
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

  void onTab() {
    final message = locator<AppMessage>();

    if (note.value.fileNo.isNotEmpty && note.value.degree.isNotEmpty && note.value.mode.isNotEmpty) {
      _repository.saveNote(note.value);
      message.showSuccessMessage(title: "İşlem Başarılı", message: "Kıyafetleriniz Sıraya Alınmıştır.");
    }
  }
}
