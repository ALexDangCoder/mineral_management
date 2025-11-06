import 'package:get_it/get_it.dart';
import 'datasource_dependency.dart' as datasource;

final injector = GetIt.instance;

Future<void> initDependencies() async {

  try {
    await datasource.config(injector);
  } catch (e) {
    print(e);
  }
}