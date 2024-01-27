// ignore_for_file: unnecessary_getters_setters
class AppUser {
  late String _id, _name, _email;
  late bool _isAdmin;

  AppUser();

  AppUser.create({required String id, required String email, required String name, required bool isAdmin}) {
    this.id = id;
    this.email = email;
    this.name = name;
    this.isAdmin = isAdmin;
  }

  ///Map içindeki kullanıcıyı nesneye dönüştürür.
  AppUser.fromMap(Map<String, dynamic> userMap) {
    id = userMap["id"];
    name = userMap["name"];
    email = userMap["email"];
    isAdmin = userMap["isAdmin"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "isAdmin": isAdmin,
    };
  }

  String get id => _id;
  String get name => _name;
  String get email => _email;
  bool get isAdmin => _isAdmin;

  set id(String id) => _id = id;
  set name(String name) => _name = name;
  set email(String email) => _email = email;
  set isAdmin(bool isAdmin) => _isAdmin = isAdmin;
}
