import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/auth/infra/datasource/access_level_datasource_interface.dart';
import 'package:smile_front/app/modules/auth/infra/repositories/access_level_repository_impl.dart';

import 'access_level_repository_impl_test.mocks.dart';

@GenerateMocks([AccessLevelDatasourceInterface])
void main() {
  late AccessLevelRepositoryImpl repository;
  AccessLevelDatasourceInterface datasource =
      MockAccessLevelDatasourceInterface();

  var mock = 'accesslevel';

  setUpAll(() {
    repository = AccessLevelRepositoryImpl(datasource: datasource);
    when(datasource.getAccessLevel('')).thenAnswer((_) async => mock);
  });

  test('getAccessLevel', () async {
    var get = await repository.getAccessLevel('');
    expect(get, mock);
  });
}
