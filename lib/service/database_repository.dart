import 'package:laundry/constant/snackbar_message.dart';
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
      return _firestore.getUser(user!.id);
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
      /// Kullanıcı daha önceden kuyruğa girdi mi?
      bool isHaveQueue = await _firestore.getQueue();
      if (isHaveQueue) {
        AppMessage.show(
          title: "Zaten sıradasınız",
          message: "Yıkama sırasına ikinci defa katılamazsınız.",
          type: Type.warning,
        );
        return false;
      }
      await _firestore.addQueue();
      return true;
    }
    return false;
  }

  Future<Note?> getNote(String id) async {
    Note? note = await _firestore.getNote(id);
    return note;
  }

  Future<List<Machine>> getMachines() async {
    return await _firestore.getMachines();
  }

  Future<AppUser?> getUser(String id) async {
    return await _firestore.getUser(id);
  }

  Future<bool> updateMachineActive(String id, bool active) async {
    return await _firestore.updateMachineActive(id, active);
  }

  Future<AppUser?> getUserFromQueue() async {
    return await _firestore.getUserFromQueue();
  }

  Future<bool> updateMachineUserId(String id, String userId) async {
    return await _firestore.updateMachineUserId(id, userId);
  }

  Future<List<AppUser>?> getAllUserFromQueue() async {
    return await _firestore.getAllUserFromQueue();
  }

  Future<Machine> addMachine() async {
    return _firestore.addMachine();
  }

  Future<bool> deleteMachine(String id) async {
    return _firestore.deleteMachine(id);
  }
}
