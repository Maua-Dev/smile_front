import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/user_pages/domain/entities/activity.dart';
import 'package:smile_front/app/modules/user_pages/domain/repositories/activities_repository_interface.dart';

part 'subscribed_activities_controller.g.dart';

class SubscribedActivitiesController = SubscribedActivitiesControllerBase
    with _$SubscribedActivitiesController;

abstract class SubscribedActivitiesControllerBase with Store {
  final ActivitiesRepositoryInterface repository;

  SubscribedActivitiesControllerBase({
    required this.repository,
  }) {
    getSubscribedActivities();
  }

  @observable
  List<Activity> activitiesList = List.empty();

  @action
  Future getSubscribedActivities() async {
    activitiesList = await repository.getSubscribedActivities();
  }

  @action
  Future unsubscribeActivity(String activityId, String userId) async {
    activitiesList = await repository.unsubscribeActivity(activityId, userId);
  }

  @action
  void orderByDate() {
    activitiesList.sort((a, b) => a.date.compareTo(b.date));
  }

  @action
  void orderByParticipants() {
    activitiesList
        .sort((a, b) => a.totalParticipants.compareTo(b.totalParticipants));
  }
}
