import 'package:get_it/get_it.dart';
import 'package:laundry/util/constant/color.dart';
import 'package:laundry/util/constant/app_message.dart';
import 'package:laundry/util/constant/style.dart';
import 'package:laundry/domain/repository/database_repository.dart';
import 'package:laundry/domain/repository/firebase_auth_service.dart';
import 'package:laundry/domain/repository/firestore.dart';

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
