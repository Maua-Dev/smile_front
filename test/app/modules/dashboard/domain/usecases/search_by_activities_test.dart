import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:smile_front/app/modules/dashboard/domain/entities/activities.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository.dart';
import 'package:smile_front/app/modules/dashboard/domain/service/presentation/activities_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/search_by_activities.dart';

import 'search_by_activities_test.mocks.dart';

@GenerateMocks([ActivitiesRepository])
void main() {
  final repository = MockActivitiesRepository();
  final usecase = SearchByActivitiesImpl(repository);

  test('Must return a list of Activities', () async {
    final result = await usecase(ActivitiesEnum.ATIVIDADE);
    expect(result, isA<List<Activities>>());
  });
}
