import 'package:get_it/get_it.dart';
import 'package:laundry/constant/color.dart';
import 'package:laundry/constant/snackbar_message.dart';
import 'package:laundry/constant/style.dart';
import 'package:laundry/service/database_repository.dart';
import 'package:laundry/service/firebase_auth_service.dart';
import 'package:laundry/service/firestore.dart';

GetIt locator = GetIt.instance;

///Buraya tanımlanan sınıflar, sürekli kullanılmasına rağmen RAM'de sadece bir kez oluşturulur.
void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => Firestore());
  locator.registerLazySingleton(() => DatabaseRepository());
  locator.registerLazySingleton(() => AppStyle());
  locator.registerLazySingleton(() => AppColor());
  locator.registerLazySingleton(() => AppMessage());
}
