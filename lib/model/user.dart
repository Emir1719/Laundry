class AppUser {
  late String _name, _email;
  late bool _isAdmin;

  AppUser() {
    isAdmin = false;
  }

  String get name => _name;
  String get email => _email;
  bool get isAdmin => _isAdmin;

  set name(String name) => _name = name;
  set email(String email) => _email = email;
  set isAdmin(bool isAdmin) => _isAdmin = isAdmin;
}
