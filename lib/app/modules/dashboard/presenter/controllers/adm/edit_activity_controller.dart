import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/schedule_activity_model.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import '../../../domain/repositories/activities_repository_interface.dart';

part 'edit_activity_controller.g.dart';

class EditActivityController = _EditActivityControllerBase
    with _$EditActivityController;

abstract class _EditActivityControllerBase with Store {
  final ActivitiesRepositoryInterface repository;
  final ActivityModel activity;

  _EditActivityControllerBase({
    required this.activity,
    required this.repository,
  });

  @observable
  late var activityToEdit = activity;

  @action
  bool isFilled() {
    if (activityToEdit.title != '') {
      return false;
    }
    return true;
  }

  @action
  Future editActivity() async {
    await repository.editActivity(activityToEdit);
  }

  @action
  Future deleteActivity(String id) async {
    await repository.removeActivity(id);
  }

  @action
  void setType(ActivityEnum? value) {
    activityToEdit = activityToEdit.copyWith(type: value);
  }

  @action
  void setTitle(String value) {
    activityToEdit = activityToEdit.copyWith(title: value);
  }

  @action
  void setDescription(String value) {
    activityToEdit = activityToEdit.copyWith(description: value);
  }

  @action
  void setLocation(String value) {
    activityToEdit = activityToEdit.copyWith(location: value);
  }

  @action
  void setDate(String value, int index) {
    var date = DateTime.parse(value);
    var list = activityToEdit.schedule;
    list[index] = activityToEdit.schedule[index].copyWith(date: date);
    activityToEdit = activityToEdit.copyWith(schedule: list);
  }

  @action
  void setHour(String value, int index) {
    var hour = DateTime.parse(value);
    var list = activityToEdit.schedule;
    list[index] = activityToEdit.schedule[index].copyWith(hour: hour);
    activityToEdit = activityToEdit.copyWith(schedule: list);
  }

  @action
  void setParticipants(int value, int index) {
    var list = activityToEdit.schedule;
    list[index] =
        activityToEdit.schedule[index].copyWith(totalParticipants: value);
    activityToEdit = activityToEdit.copyWith(schedule: list);
  }

  @action
  void addSchedule() {
    var list = activityToEdit.schedule;
    list.add(ScheduleActivityModel.newInstance());
    activityToEdit = activityToEdit.copyWith(schedule: list);
  }

  @action
  void removeSchedule(int index) {
    var list = activityToEdit.schedule;
    list.removeAt(index);
    activityToEdit = activityToEdit.copyWith(schedule: list);
  }
}
