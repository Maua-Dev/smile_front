import 'package:mobx/mobx.dart';

import '../../../domain/repositories/activities_repository_interface.dart';

part 'create_activity_controller.g.dart';

class CreateActivityController = _CreateActivityControllerBase
    with _$CreateActivityController;

abstract class _CreateActivityControllerBase with Store {
  final ActivitiesRepositoryInterface repository;

  _CreateActivityControllerBase({
    required this.repository,
  });
}
