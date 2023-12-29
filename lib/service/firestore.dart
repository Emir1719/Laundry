// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:laundry/model/database.dart';
import 'package:laundry/model/note.dart';
import 'package:laundry/model/user.dart';

class Firestore implements Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<bool> saveUser(AppUser user) async {
    try {
      Map<String, dynamic> userMap = user.toMap();
      await _firestore.collection("users").doc(user.id).set(userMap);

      return true;
    } catch (e) {
      print("Kullanıcı kayıt edilemedi. Hata: ${e.toString()}");
    }
    return false;
  }

  @override
  Future<AppUser?> getUser(String id) async {
    var userDocument = await _firestore.doc("users/$id").get();
    return AppUser.fromMap(userDocument.data()!);
  }

  @override
  Future<bool> saveNote(Note note) async {
    try {
      Map<String, dynamic> map = note.toMap();
      await _firestore.collection("notes").doc(_auth.currentUser!.uid).set(map);
      return true;
    } catch (e) {
      print("Not kayıt edilemedi. Hata: ${e.toString()}");
    }
    return false;
  }
}
