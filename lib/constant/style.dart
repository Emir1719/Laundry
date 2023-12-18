class AppStyle {
  static AppStyle? _instance;

  AppStyle._();

  // Singleton örneğine erişim sağlayan statik metot
  static AppStyle getInstance() {
    _instance ??= AppStyle._();
    return _instance!;
  }
}
