import 'package:bnv_opendata/core/network/api_service.dart';
import 'package:bnv_opendata/core/network/dio_client.dart';
import 'package:bnv_opendata/data/datasource/local/secure_storage_service.dart';
import 'package:bnv_opendata/data/datasource/local/secure_storate_service_impl.dart';
import 'package:bnv_opendata/data/datasource/remote/auth_remote_datasource.dart';
import 'package:bnv_opendata/data/repositories/repository_exports.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:bnv_opendata/presentation/main_cubit/auth_event_bus.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:bnv_opendata/domain/env/model/app_constants.dart';

Future<void> registerDataSource(GetIt injector) async {
  try {
    // EventBus singleton
    injector.registerLazySingleton<AuthEventBus>(() => AuthEventBus());

    injector.registerLazySingleton<Dio>(() {
      final baseUrl = Get.isRegistered<AppConstants>() 
          ? Get.find<AppConstants>().baseUrl
          : "https://222.252.98.48:9292/";
          
      return DioClient(
              baseUrl: baseUrl,
              localStorage: injector<AppLocalStorageRepository>(),
              eventBus: injector<AuthEventBus>())
          .dio;
    });

    injector.registerLazySingleton<ApiService>(
      () => ApiService(injector<Dio>()),
    );
    // Data Sources
    injector.registerLazySingleton<SecureStorageService>(
      () => SecureStorageServiceImpl(),
    );
    injector.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(injector()),
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
        injector(),
      ),
    );
  } catch (e) {}
}
