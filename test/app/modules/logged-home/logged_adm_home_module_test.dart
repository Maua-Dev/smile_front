import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/logged-home/external/future_activity_datasource_impl.dart';
import 'package:smile_front/app/modules/logged-home/external/user_datasource_impl.dart';
import 'package:smile_front/app/modules/logged-home/infra/datasources/future_activity_datasource.dart';
import 'package:smile_front/app/modules/logged-home/infra/repository/future_activity_repository_impl.dart';
import 'package:smile_front/app/modules/logged-home/logged_home_module.dart';

void main() {
  initModules([AppModule(), LoggedHomeModule()]);

  test('FutureActivityDatasourceImpl Injection', () {
    Modular.get<FutureActivityDatasourceImpl>();
  });

  test('FutureActivityRepositoryImpl Injection', () {
    var repository = Modular.get<FutureActivityRepositoryImpl>();
    expect(repository.datasource, isInstanceOf<FutureActivityDatasource>());
  });

  test('UserDatasourceImpl Injection', () {
    Modular.get<UserDatasourceImpl>();
  });

  test('FutureActivityRepositoryImpl Injection', () {
    var repository = Modular.get<FutureActivityRepositoryImpl>();
    expect(repository.datasource, isInstanceOf<FutureActivityDatasource>());
  });
}
