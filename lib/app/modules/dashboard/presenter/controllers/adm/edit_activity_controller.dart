import 'package:intl/intl.dart';
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
  // final admDashboardController = Modular.get<AdmDashboardController>();

  _EditActivityControllerBase({
    required this.activity,
    required this.repository,
  });

  @observable
  late var activityToEdit = activity;

  @action
  bool isFilled() {
    if (activityToEdit.title != '') {
      return true;
    }
    return false;
  }

  @action
  Future editActivity() async {
    await repository.editActivity(activityToEdit);
    // admDashboardController.getAllActivities();
  }

  @action
  Future deleteActivity(String id) async {
    await repository.removeActivity(id);
    // admDashboardController.getAllActivities();
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
    if (value.length >= 10) {
      var year = value.substring(6, 10);
      var month = value.substring(3, 5);
      var day = value.substring(0, 2);
      value = '$year-$month-$day';
      var hour = activityToEdit.schedule[index].date != null
          ? DateFormat('HH:mm').format(activityToEdit.schedule[index].date!)
          : '';
      var date = DateTime.parse("$value $hour");
      var list = activityToEdit.schedule;
      list[index] = activityToEdit.schedule[index].copyWith(date: date);
      activityToEdit = activityToEdit.copyWith(schedule: list);
    }
  }

  @action
  void setHour(String value, int index) {
    if (value.length >= 5) {
      var date = activityToEdit.schedule[index].date != null
          ? DateFormat('yyyy-MM-dd')
              .format(activityToEdit.schedule[index].date!)
          : '';
      var hour = DateTime.parse("$date $value");
      var list = activityToEdit.schedule;
      list[index] = activityToEdit.schedule[index].copyWith(date: hour);
      activityToEdit = activityToEdit.copyWith(schedule: list);
    }
  }

  @action
  void setParticipants(int value, int index) {
    var list = activityToEdit.schedule;
    list[index] =
        activityToEdit.schedule[index].copyWith(totalParticipants: value);
    activityToEdit = activityToEdit.copyWith(schedule: list);
  }

  @action
  void setSpeakerName(String value) {
    var speaker = activityToEdit.speaker.copyWith(name: value);
    activityToEdit = activityToEdit.copyWith(speaker: speaker);
  }

  @action
  void setSpeakerBio(String value) {
    var speaker = activityToEdit.speaker.copyWith(bio: value);
    activityToEdit = activityToEdit.copyWith(speaker: speaker);
  }

  @action
  void setSpeakerCompany(String value) {
    var speaker = activityToEdit.speaker.copyWith(company: value);
    activityToEdit = activityToEdit.copyWith(speaker: speaker);
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
