import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry/model/announcement.dart';
import 'package:laundry/model/machine.dart';
import 'package:laundry/model/note.dart';
import 'package:laundry/model/user.dart';

abstract class Database {
  Future<bool> saveUser(AppUser user);
  Future<AppUser?> getUser(String id);
  Future<bool> saveNote(Note note);
  Future<Note?> getNote(String id);
  Future<bool> getQueue();
  Future<List<AppUser>?> getAllUserFromQueue();
  Future<bool> updateMachineActive(String id, bool active);
  Future<bool> updateMachineUserId(String id, String userId);
  Future<bool> addQueue();
  Future<AppUser?> getUserFromQueue();
  Future<List<Machine>> getMachines();
  Future<Machine> addMachine();
  Future<bool> deleteMachine(String id);
  Future<bool> deleteAnnouncement(String id);
  Future<bool> saveAnnouncement(Announcement announcement);
  Future<List<Announcement>> getAnnouncements();
  Stream<QuerySnapshot<Map<String, dynamic>>>? getMachinesStream();
  Stream<QuerySnapshot<Map<String, dynamic>>>? getAllUserFromQueueStream();
  Stream<QuerySnapshot<Map<String, dynamic>>>? getAnnouncementsStream();
}
