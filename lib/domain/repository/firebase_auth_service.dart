// ignore_for_file: avoid_print, unused_catch_clause
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:laundry/presentation/controller/auth_controller.dart';
import 'package:laundry/presentation/controller/auth_validator.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/domain/model/user.dart';
import 'package:laundry/domain/repository/firestore.dart';
import '../../data/auth_base.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _database = locator<Firestore>();

  User? get user => _auth.currentUser;

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
      return appUser;
    } on FirebaseAuthException catch (e) {
      AuthValidator.getMessageAuth(e);
    }
    return null;
  }

  @override
  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      AuthValidator.getMessageAuth(e);
      return false;
    }
  }

  @override
  Future<AppUser?> register(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return _createUser(userCredential.user, false);
    } on FirebaseAuthException catch (e) {
      AuthValidator.getMessageAuth(e);
      return null;
    }
  }

  @override
  Future<AppUser?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      AppUser? appUser = await _database.getUser(userCredential.user!.uid);
      return _createUser(userCredential.user, appUser!.isAdmin);
    } on FirebaseAuthException catch (e) {
      AuthValidator.getMessageAuth(e);
    }
    return null;
  }

  @override
  Future<void> updateUser(Map<String, dynamic> map) async {
    try {
      // Auth'da kullanıcı bilgilerini güncelle
      if (map["email"] == "" && map["password"] == "") {
        print("fdsc");
        return;
      }
      /*final credentials = EmailAuthProvider.credential(email: _auth.currentUser!.email!, password: map["password"]);
      final user = _auth.currentUser!;
      final authResult = await user.reauthenticateWithCredential(credentials);

      // Eğer kimlik doğrulama başarılıysa, yeni şifreyi ayarlayın
      if (authResult.user != null) {
        await user.updatePassword(map["newPassword"]);
        await user.updateEmail(map["email"]);
        print('Şifre başarıyla güncellendi');
      } else {
        print('Şifre güncelleme sırasında bir hata oluştu: Kullanıcı kimlik doğrulaması başarısız.');
      }*/
      final user = _auth.currentUser!;
      if (map["email"] != "") {
        await user.updateEmail(map["email"]).then((value) => print("güncellendi"));
      }
      if (map["password"] != "") {
        await user.updatePassword(map["newPassword"]);
      }
    } catch (e) {
      print('Hata oluştu: $e');
    }
  }
}
