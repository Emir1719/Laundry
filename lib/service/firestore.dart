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

  ///Kullanıcın bilgilerini döndürür.
  @override
  Future<AppUser?> getUser(String id) async {
    var userDocument = await _firestore.doc("users/$id").get();
    return AppUser.fromMap(userDocument.data()!);
  }

  ///Kullanıcının yıkama hakkındaki notunu ekler.
  @override
  Future<bool> saveNote(Note note) async {
    try {
      Map<String, dynamic> map = note.toMap();
      var docRef = _firestore.collection("notes").doc(_auth.currentUser!.uid);
      //İlgili kullanıcıya ait not varsa güncelle yoksa yenisini ekle.
      //set fonk id varsa öncekinin üzerine yazıyor. o yüzden update fonk kullanılmadı.
      await docRef.set(map);
      return true;
    } catch (e) {
      print("Not kayıt edilemedi. Hata: ${e.toString()}");
    }
    return false;
  }

  ///Kullanıcının yıkama hakkındaki notunu ekler.
  @override
  Future<Note?> getNote() async {
    try {
      var docRef = _firestore.collection("notes").doc(_auth.currentUser!.uid);
      var snapshot = await docRef.get();
      if (snapshot.exists) {
        Map<String, dynamic>? map = snapshot.data();
        if (map != null) {
          return Note.fromMap(map);
        }
      }
    } catch (e) {
      print("Not kayıt edilemedi. Hata: ${e.toString()}");
    }
    return null;
  }

  ///Kullanıcı yıkama sırasına eklenir.
  @override
  Future<bool> addQueue() async {
    try {
      Map<String, dynamic> map = {
        "date": Timestamp.now(),
      };
      //Doc id, kullancının id'si olduğu için kullanıcı hakkında ekstra bilgi eklenmedi.
      await _firestore.collection("queue").doc(_auth.currentUser!.uid).set(map);
      return true;
    } catch (e) {
      print("Not kayıt edilemedi. Hata: ${e.toString()}");
      return false;
    }
  }
}
