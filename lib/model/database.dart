import 'package:laundry/model/note.dart';
import 'package:laundry/model/user.dart';

abstract class Database {
  Future<bool> saveUser(AppUser user);
  Future<AppUser?> getUser(String id);
  Future<bool> saveNote(Note note);
}
