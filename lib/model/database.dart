import 'package:laundry/model/user.dart';

abstract class Database {
  Future<bool> saveUser(AppUser user);
  Future<AppUser?> getUser(String id);
}
