import 'package:bnv_opendata/dependencies/datasource_dependency.dart';
import 'package:bnv_opendata/dependencies/usecase_dependency.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initDependencies() async {
  try {
    await registerDataSource(injector);
    await registerUseCase(injector);
  } catch (e) {
    print(e);
  }
}