// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:laundry/constant/app_message.dart';
import 'package:laundry/model/announcement.dart';
import 'package:laundry/service/database.dart';
import 'package:laundry/model/machine.dart';
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
  Future<Note?> getNote(String id) async {
    try {
      var docRef = _firestore.collection("notes").doc(id);
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

  @override
  Future<List<Machine>> getMachines() async {
    try {
      var docRef = await _firestore.collection("machines").orderBy("date", descending: false).get();
      List<Machine> machines = docRef.docs.map((e) => Machine.fromMap(e.data())).toList();
      return machines;
    } catch (e) {
      return [];
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>>? getMachinesStream() {
    try {
      var docRef = _firestore.collection("machines").orderBy("date", descending: false).snapshots();
      return docRef;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> updateMachineActive(String id, bool active) async {
    try {
      await _firestore.collection("machines").doc(id).update({"isActive": active});
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<AppUser?> getUserFromQueue() async {
    var querySnapshot = await _firestore.collection("queue").orderBy("date", descending: false).get();

    if (querySnapshot.docs.isNotEmpty) {
      // En son tarihe sahip belgeyi al
      var latestDoc = querySnapshot.docs.first;
      var appUser = getUser(latestDoc.id);

      // Belgeyi sil
      await _firestore.collection("queue").doc(latestDoc.id).delete();

      return appUser;
    }
    return null;
  }

  @override
  Future<bool> updateMachineUserId(String id, String userId) async {
    try {
      await _firestore.collection("machines").doc(id).update({"userId": userId});
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> getQueue() async {
    try {
      var querySnapshot = await _firestore.collection("queue").doc(_auth.currentUser!.uid).get();
      return querySnapshot.exists;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<AppUser>?> getAllUserFromQueue() async {
    try {
      List<AppUser> list = [];
      var querySnapshot = await _firestore.collection("queue").orderBy("date", descending: false).get();
      for (var item in querySnapshot.docs) {
        list.add((await getUser(item.id))!);
      }
      return list;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Machine> addMachine() async {
    try {
      var ref = await _firestore.collection("machines").add(Machine().toMap());

      // Belge referansından belge ID'sini al
      String documentId = ref.id;

      // Machine nesnesini Firestore'dan çekilen verilerle oluştur
      var machineData = await _firestore.collection("machines").doc(documentId).get();
      var machine = Machine.fromMap(machineData.data() as Map<String, dynamic>);

      // Machine nesnesine belge ID'sini ekle
      machine.id = documentId;

      // Machine nesnesini güncelleyerek Firestore'a kaydet
      await _firestore.collection("machines").doc(documentId).update(machine.toMap());

      return machine;
    } catch (e) {
      print("Error adding machine to Firestore: $e");
      rethrow;
    }
  }

  @override
  Future<bool> deleteMachine(String id) async {
    try {
      await _firestore.collection("machines").doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<Announcement>> getAnnouncements() async {
    try {
      var ref = await _firestore.collection("announcements").orderBy("date", descending: true).get();
      List<Announcement> announcements = ref.docs.map((doc) => Announcement.fromMap(doc.data())).toList();
      return announcements;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> deleteAnnouncement(String id) async {
    try {
      await _firestore.collection("announcements").doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> saveAnnouncement(Announcement announcement) async {
    try {
      Map<String, dynamic> map = announcement.toMap();
      var ref = await _firestore.collection("announcements").add(map);
      String documentId = ref.id;

      var data = await _firestore.collection("announcements").doc(documentId).get();
      var announ = Announcement.fromMap(data.data() as Map<String, dynamic>);

      announ.id = documentId;
      await _firestore.collection("announcements").doc(documentId).update(announ.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>>? getAllUserFromQueueStream() {
    try {
      var querySnapshot = _firestore.collection("queue").orderBy("date", descending: false).snapshots();
      return querySnapshot;
    } catch (e) {
      return null;
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>>? getAnnouncementsStream() {
    try {
      var ref = _firestore.collection("announcements").orderBy("date", descending: true).snapshots();
      return ref;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> saveToken(String token) async {
    try {
      var docRef = _firestore.collection("tokens").doc(_auth.currentUser!.uid);
      await docRef.set({"token": token});
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String?> getToken(String id) async {
    try {
      var docSnapshot = await _firestore.collection("tokens").doc(id).get();

      if (docSnapshot.exists) {
        // Eğer doküman varsa, 'token' alanındaki değeri döndür
        return docSnapshot['token'] as String?;
      } else {
        // Eğer doküman yoksa, null döndür
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<String>> getAllToken() async {
    var ref = await _firestore.collection("tokens").get();
    List<String> tokens = ref.docs.map((doc) => doc.data()["token"].toString().trim()).toSet().toList();
    return tokens;
  }

  @override
  Future<void> updateUser(Map<String, dynamic> map) async {
    try {
      if (map.containsKey('password') && map.containsKey('newPassword')) {
        map.remove('password');
        map.remove('newPassword');
      }
      // Firestore'da kullanıcı belgesini al ve güncelle
      await _firestore.collection('users').doc(_auth.currentUser!.uid).update(map);

      // Başarılı bir şekilde güncellendi
      AppMessage.show(title: "Kullanıcı ayarları güncellendi", message: "Başarılı");
    } catch (error) {
      AppMessage.show(title: "Güncelleme sırasında bir hata oluştu", message: error.toString(), type: Type.error);
    }
  }

  @override
  Future<void> deleteToken() async {
    await _firestore.collection("tokens").doc(_auth.currentUser!.uid).delete();
  }
}
