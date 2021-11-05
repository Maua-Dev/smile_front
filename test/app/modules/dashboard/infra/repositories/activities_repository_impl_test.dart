import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/dashboard/domain/entities/activities.dart';
import 'package:smile_front/app/modules/dashboard/domain/service/presentation/activities_enum.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/activities_model.dart';
import 'package:smile_front/app/modules/dashboard/infra/repositories/activities_repository_impl.dart';

import 'activities_repository_impl_test.mocks.dart';

@GenerateMocks([ActivitiesDatasource])
void main() {
  final datasource = MockActivitiesDatasource();
  final repository = ActivitiesRepositoryImpl(datasource);
  test('Must return a list of Activities', () {
    when(datasource.getActivities(any))
        .thenAnswer((_) async => <ActivitiesModel>[]);
    final result = repository.getActivities(ActivitiesEnum.ATIVIDADE);
    expect(result, isA<List<Activities>>());
  });
}
