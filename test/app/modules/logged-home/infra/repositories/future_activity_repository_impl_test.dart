import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/logged-home/infra/datasources/future_activity_datasource.dart';
import 'package:smile_front/app/modules/logged-home/infra/repository/future_activity_repository_impl.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

import 'future_activity_repository_impl_test.mocks.dart';

@GenerateMocks([FutureActivityDatasource])
void main() {
  late FutureActivityRepositoryImpl repository;
  FutureActivityDatasource datasource = MockFutureActivityDatasource();
  var activity = ActivityModel(
      id: '123',
      enrolledUsers: [],
      name: '',
      description: '',
      date: DateTime.now(),
      type: ActivityEnum.ACADEMIA_DE_PROFESSORES,
      createdAt: '',
      updateAt: '',
      workload: 40);

  setUpAll(() {
    repository = FutureActivityRepositoryImpl(datasource: datasource);
    when(datasource.getFutureActivity()).thenAnswer((_) async => activity);
  });

  test('getFutureActivity', () async {
    var test = await repository.getFutureActivity();
    expect(test.id, '123');
  });
}
