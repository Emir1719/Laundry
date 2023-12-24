// ignore_for_file: avoid_print, unused_catch_clause
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:laundry/controller/auth_controller.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/user.dart';
import 'package:laundry/service/firestore.dart';
import '../model/auth_base.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _database = locator<Firestore>();

  ///Firebase'in kullanıcısından kendi kullanıcı nesnemizi oluşturuyoruz.
  ///[user] Firebase kullanıcısı
  AppUser? _createUser(User? user, bool isAdmin) {
    if (user == null) {
      return null;
    }
    final controller = Get.put(AuthController());
    return AppUser.create(id: user.uid, email: user.email!, name: controller.name.value, isAdmin: isAdmin);
  }

  @override
  bool isUserLogin() {
    return _auth.currentUser != null;
  }

  @override
  Future<AppUser?> currentUser() async {
    try {
      User? user = _auth.currentUser;
      AppUser? appUser = await _database.getUser(user!.uid);
      return _createUser(user, appUser!.isAdmin);
    } catch (e) {
      print("currentUser fonksiyonunda hata çıktı: ${e.toString()}");
    }
    return null;
  }

  @override
  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      print("signOut fonksiyonunda hata çıktı: ${e.toString()}");
    }
    return false;
  }

  @override
  Future<AppUser?> register(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return _createUser(userCredential.user, false);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  @override
  Future<AppUser?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      AppUser? appUser = await _database.getUser(userCredential.user!.uid);
      return _createUser(userCredential.user, appUser!.isAdmin);
    } on FirebaseException catch (e) {
      //print("signInWithEmailAndPassword fonksiyonunda hata çıktı: ${e.toString()}");
    }
    return null;
  }
}
