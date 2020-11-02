import 'package:get_it/get_it.dart';
import 'package:uplanit_supplier/core/services/authentication_service.dart';
// import 'package:uplanit_supplier/app/services/api_service.dart';
// import 'package:uplanit_supplier/app/services/authentication_service.dart';
// import 'package:uplanit_supplier/app/services/firebase_service.dart';
// import 'package:uplanit_supplier/app/viewmodels/auth_model.dart';


// This is our global ServiceLocator
GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
//   locator.registerLazySingleton(() => FirebaseService());
//   locator.registerLazySingleton(() => AuthenticationService());

//   locator.registerFactory(() => AuthModel());
}
