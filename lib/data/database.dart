import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry/domain/model/announcement.dart';
import 'package:laundry/domain/model/machine.dart';
import 'package:laundry/domain/model/note.dart';
import 'package:laundry/domain/model/user.dart';

abstract class Database {
  // User
  Future<bool> saveUser(AppUser user);
  Future<void> updateUser(Map<String, dynamic> map);
  Future<AppUser?> getUser(String id);

  // Note
  Future<bool> saveNote(Note note);
  Future<Note?> getNote(String id);

  // Queue
  Future<bool> getQueue();
  Future<List<AppUser>?> getAllUserFromQueue();
  Future<bool> addQueue();
  Future<AppUser?> getUserFromQueue();
  Stream<QuerySnapshot<Map<String, dynamic>>>? getAllUserFromQueueStream();

  // Machine
  Future<bool> updateMachineActive(String id, bool active);
  Future<bool> updateMachineType(String id, String value);
  Future<bool> updateMachineUserId(String id, String userId);
  Future<List<Machine>> getMachines();
  Future<Machine> addMachine();
  Future<bool> deleteMachine(String id);
  Stream<QuerySnapshot<Map<String, dynamic>>>? getMachinesStream();

  // Announcement
  Future<bool> deleteAnnouncement(String id);
  Future<bool> saveAnnouncement(Announcement announcement);
  Future<List<Announcement>> getAnnouncements();
  Stream<QuerySnapshot<Map<String, dynamic>>>? getAnnouncementsStream();

  // Token
  Future<bool> saveToken(String token);
  Future<String?> getToken(String id);
  Future<void> deleteToken();
  Future<List<String>> getAllToken();
}
