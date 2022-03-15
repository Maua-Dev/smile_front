import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/models/activity_model.dart';
import '../../../domain/infra/activity_enum.dart';
import '../../../domain/repositories/activities_repository_interface.dart';
import '../../../infra/models/schedule_activity_model.dart';

part 'create_activity_controller.g.dart';

class CreateActivityController = _CreateActivityControllerBase
    with _$CreateActivityController;

abstract class _CreateActivityControllerBase with Store {
  final ActivitiesRepositoryInterface repository;

  _CreateActivityControllerBase({
    required this.repository,
  });

  @observable
  var activityToCreate = ActivityModel.newInstance();

  @action
  bool isFilled() {
    if (activityToCreate.title != '') {
      return true;
    }
    return false;
  }

  @action
  Future createActivity() async {
    await repository.createActivity(activityToCreate);
  }

  @action
  void setType(ActivityEnum? value) {
    activityToCreate = activityToCreate.copyWith(type: value);
  }

  @action
  void setTitle(String value) {
    activityToCreate = activityToCreate.copyWith(title: value);
  }

  @action
  void setDescription(String value) {
    activityToCreate = activityToCreate.copyWith(description: value);
  }

  @action
  void setLocation(String value) {
    activityToCreate = activityToCreate.copyWith(location: value);
  }

  @action
  void setDate(String value, int index) {
    if (value.length >= 10) {
      var year = value.substring(6, 10);
      var month = value.substring(3, 5);
      var day = value.substring(0, 2);
      value = '$year-$month-$day';
      var hour = activityToCreate.schedule[index].date != null
          ? DateFormat('HH:mm').format(activityToCreate.schedule[index].date!)
          : '';
      var date =
          hour == '' ? DateTime.parse(value) : DateTime.parse("$value $hour");
      var list = activityToCreate.schedule;
      list[index] = activityToCreate.schedule[index].copyWith(date: date);
      activityToCreate = activityToCreate.copyWith(schedule: list);
    }
  }

  @action
  void setHour(String value, int index) {
    if (value.length >= 5) {
      var date = activityToCreate.schedule[index].date != null
          ? DateFormat('yyyy-MM-dd')
              .format(activityToCreate.schedule[index].date!)
          : '';
      var hour = date == ''
          ? DateTime.parse('0000-00-00 $value')
          : DateTime.parse("$date $value");
      var list = activityToCreate.schedule;
      list[index] = activityToCreate.schedule[index].copyWith(date: hour);
      activityToCreate = activityToCreate.copyWith(schedule: list);
    }
  }

  @action
  void setParticipants(int value, int index) {
    var list = activityToCreate.schedule;
    list[index] =
        activityToCreate.schedule[index].copyWith(totalParticipants: value);
    activityToCreate = activityToCreate.copyWith(schedule: list);
  }

  @action
  void setSpeakerName(String value) {
    var speaker = activityToCreate.speaker.copyWith(name: value);
    activityToCreate = activityToCreate.copyWith(speaker: speaker);
  }

  @action
  void setSpeakerBio(String value) {
    var speaker = activityToCreate.speaker.copyWith(bio: value);
    activityToCreate = activityToCreate.copyWith(speaker: speaker);
  }

  @action
  void setSpeakerCompany(String value) {
    var speaker = activityToCreate.speaker.copyWith(company: value);
    activityToCreate = activityToCreate.copyWith(speaker: speaker);
  }

  @action
  void addSchedule() {
    var list = activityToCreate.schedule;
    list.add(ScheduleActivityModel.newInstance());
    activityToCreate = activityToCreate.copyWith(schedule: list);
  }

  @action
  void removeSchedule(int index) {
    var list = activityToCreate.schedule;
    list.removeAt(index);
    activityToCreate = activityToCreate.copyWith(schedule: list);
  }
}
