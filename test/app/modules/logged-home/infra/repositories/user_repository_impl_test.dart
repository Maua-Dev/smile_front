import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/logged-home/infra/datasources/user_datasource.dart';
import 'package:smile_front/app/modules/logged-home/infra/repository/user_repository_impl.dart';
import 'package:smile_front/app/shared/models/user_model.dart';

import 'user_repository_impl_test.mocks.dart';

@GenerateMocks([UserDatasource])
void main() {
  late UserRepositoryImpl repository;
  UserDatasource datasource = MockUserDatasource();
  var user = UserModel(
      email: '', cpfRne: '123', accessLevel: '', typeRole: '', socialName: '');

  setUpAll(() {
    repository = UserRepositoryImpl(datasource: datasource);
    when(datasource.getLoggedUser('')).thenAnswer((_) async => user);
  });

  test('getUser', () async {
    var test = await repository.getUser('');
    expect(test.cpfRne, '123');
  });
}
