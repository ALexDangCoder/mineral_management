import 'package:bnv_opendata/domain/usecases/usecase_export.dart';
import 'package:get_it/get_it.dart';

Future<void> registerUseCase(GetIt injector) async {
  try {
    injector.registerFactory(
      () => LoginUseCase(injector()),
    );
    injector.registerFactory(
      () => CheckAuthStatusUseCase(injector()),
    );
    injector.registerFactory(
      () => ChangePasswordUseCase(injector()),
    );
  } catch (_) {}
}
