import 'package:dartz/dartz.dart';
import 'package:smile_front/app/modules/dashboard/domain/entities/activities.dart';
import 'package:smile_front/app/modules/dashboard/domain/errors/errors.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository.dart';

import 'package:smile_front/app/modules/dashboard/domain/service/presentation/activities_enum.dart';

abstract class SearchByActivities {
  Future<Either<FailureGetActivities, Future<List<Activities>>>> call(
      ActivitiesEnum activitiesEnum);
}

class SearchByActivitiesImpl implements SearchByActivities {
  final ActivitiesRepository repository;

  SearchByActivitiesImpl(this.repository);

  @override
  Future<Either<FailureGetActivities, Future<List<Activities>>>> call(
      ActivitiesEnum activitiesEnum) async {
    return await repository.getActivities(activitiesEnum);
  }
}
