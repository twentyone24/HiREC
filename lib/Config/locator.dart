import 'package:get_it/get_it.dart';
import '../Service/FirebaseAuthService.dart';
import '../Service/FirestoreDatabaseService.dart';
import '../Service/repository.dart';
import '../View Models/UserViewModel.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => FirestoreDatabaseService());
  locator.registerLazySingleton(() => Repository());
  locator.registerLazySingleton(() => UserViewModel());
}
