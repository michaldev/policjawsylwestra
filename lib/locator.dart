import 'package:get_it/get_it.dart';
import 'package:policjawsylwestra/data/firebase_impl.dart';
import 'package:policjawsylwestra/domain/data_repository.dart';

GetIt locator = GetIt.instance;

void setupDI() {
  locator.registerLazySingleton<DataRepository>(() => FirebaseImpl());
}
