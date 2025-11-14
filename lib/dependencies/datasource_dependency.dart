import 'package:bnv_opendata/data/datasource/local/secure_storage_service.dart';
import 'package:bnv_opendata/data/datasource/local/secure_storate_service_impl.dart';
import 'package:bnv_opendata/data/datasource/repositories/repository_impl_exports.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:get_it/get_it.dart';

Future<void> config(GetIt injector) async {
  try {
    // Data Sources
    injector.registerLazySingleton<SecureStorageService>(
      () => SecureStorageServiceImpl(),
    );

    // Repository & Remote
    injector.registerLazySingleton<AppLocalStorageRepository>(
      () => AppLocalStorageRepositoryImpl(
        dataSource: injector(),
      ),
    );
    injector.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        injector(),
      ),
    );
  } catch (e) {}
}
