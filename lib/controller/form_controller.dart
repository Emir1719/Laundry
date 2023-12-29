import 'package:get/get.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/note.dart';
import 'package:laundry/service/database_repository.dart';

class FormController extends GetxController {
  var note = Note().obs;
  final _repository = locator<DatabaseRepository>();

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
    if (note.value.fileNo.isNotEmpty && note.value.degree.isNotEmpty && note.value.mode.isNotEmpty) {
      _repository.saveNote(note.value);
    }
  }
}
