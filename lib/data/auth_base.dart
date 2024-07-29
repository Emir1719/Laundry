import 'package:laundry/domain/model/user.dart';

abstract class AuthBase {
  Future<AppUser?> currentUser();
  Future<AppUser?> signIn(String email, String password);
  Future<AppUser?> register(String email, String password);
  Future<bool> signOut();
  bool isUserLogin();
}
