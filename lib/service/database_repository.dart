import 'package:laundry/locator.dart';
import 'package:laundry/model/auth_base.dart';
import 'package:laundry/model/machine.dart';
import 'package:laundry/model/note.dart';
import 'package:laundry/model/user.dart';
import 'package:laundry/service/firebase_auth_service.dart';
import 'package:laundry/service/firestore.dart';

class DatabaseRepository implements AuthBase {
  final _authService = locator<FirebaseAuthService>();
  final _firestore = locator<Firestore>();

  @override
  Future<AppUser?> currentUser() async {
    return await _authService.currentUser();
  }

  @override
  Future<bool> signOut() async {
    return await _authService.signOut();
  }

  @override
  Future<AppUser?> register(String email, String password) async {
    try {
      AppUser? user = await _authService.register(email, password);
      await _firestore.saveUser(user!);
      //Auth'dan değil veritabanından veriler çekiliyor:
      return _firestore.getUser(user.id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<AppUser?> signIn(String email, String password) async {
    try {
      AppUser? user = await _authService.signIn(email, password);
      await _firestore.saveUser(user!);
      return _firestore.getUser(user.id);
    } catch (e) {
      return null;
    }
  }

  @override
  bool isUserLogin() {
    return _authService.isUserLogin();
  }

  Future<bool> saveNote(Note note) async {
    bool result = await _firestore.saveNote(note);
    if (result) {
      await _firestore.addQueue();
      return true;
    }
    return false;
  }

  Future<Note?> getNote() async {
    Note? note = await _firestore.getNote();
    return note;
  }

  Future<List<Machine>> getMachines() async {
    return await _firestore.getMachines();
  }

  Future<AppUser?> getUser(String id) async {
    return await _firestore.getUser(id);
  }
}
