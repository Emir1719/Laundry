import 'package:get_it/get_it.dart';
import 'package:laundry/service/firebase_auth_service.dart';
import 'package:laundry/service/firestore.dart';

GetIt locator = GetIt.instance;

///Buraya tanımlanan sınıflar, sürekli kullanılmasına rağmen RAM'de sadece bir kez oluşturulur.
void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => Firestore());
}
