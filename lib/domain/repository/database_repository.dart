import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:laundry/util/constant/app_message.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/domain/model/announcement.dart';
import 'package:laundry/domain/model/machine.dart';
import 'package:laundry/domain/model/note.dart';
import 'package:laundry/domain/model/user.dart';
import 'package:laundry/domain/repository/firebase_auth_service.dart';
import 'package:laundry/domain/repository/firestore.dart';

class DatabaseRepository {
  final _authService = locator<FirebaseAuthService>();
  final _firestore = locator<Firestore>();

  User? get user => _authService.user;

  Future<AppUser?> currentUser() async {
    return await _authService.currentUser();
  }

  Future<bool> signOut() async {
    return await _authService.signOut();
  }

  Future<AppUser?> register(String email, String password) async {
    try {
      AppUser? user = await _authService.register(email, password);
      await _firestore.saveUser(user!);
      //await this.user!.sendEmailVerification();
      //Auth'dan değil veritabanından veriler çekiliyor:
      return _firestore.getUser(user.id);
    } catch (e) {
      return null;
    }
  }

  Future<AppUser?> signIn(String email, String password) async {
    try {
      AppUser? user = await _authService.signIn(email, password);
      return _firestore.getUser(user!.id);
    } catch (e) {
      return null;
    }
  }

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

  Future<List<Announcement>> getAnnouncements() async {
    return await _firestore.getAnnouncements();
  }

  Future<bool> deleteAnnouncement(String id) async {
    return _firestore.deleteAnnouncement(id);
  }

  Future<bool> saveAnnouncement(Announcement announcement) async {
    return _firestore.saveAnnouncement(announcement);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? getMachinesSnapshot() {
    return _firestore.getMachinesStream();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? getAllUserFromQueueStream() {
    return _firestore.getAllUserFromQueueStream();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? getAnnouncementsStream() {
    return _firestore.getAnnouncementsStream();
  }

  Future<bool> saveToken(String token) async {
    return _firestore.saveToken(token);
  }

  Future<String?> getToken(String id) async {
    return _firestore.getToken(id);
  }

  Future<List<String>> getAllToken() async {
    return _firestore.getAllToken();
  }

  Future<void> updateUser(Map<String, dynamic> map) async {
    //await _authService.updateUser(map);
    await _firestore.updateUser(map);
  }

  Future<void> deleteToken() async {
    await _firestore.deleteToken();
  }

  Future<bool> updateMachineType(String id, String value) async {
    return _firestore.updateMachineType(id, value);
  }
}
