import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/adm_dashboard_controller.dart';

import '../../../../../shared/models/activity_model.dart';
import '../../../domain/infra/activity_enum.dart';
import '../../../domain/repositories/activities_repository_interface.dart';
import '../../../infra/models/schedule_activity_model.dart';
import '../../../infra/models/speaker_activity_model.dart';

part 'create_activity_controller.g.dart';

class CreateActivityController = _CreateActivityControllerBase
    with _$CreateActivityController;

abstract class _CreateActivityControllerBase with Store {
  final ActivitiesRepositoryInterface repository;
  final admDashboardController = Modular.get<AdmDashboardController>();

  _CreateActivityControllerBase({
    required this.repository,
  });

  @observable
  var activityToCreate = ActivityModel.newInstance();

  @observable
  bool isLoading = false;

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @action
  bool isFilled() {
    var scheduleFirst = activityToCreate.schedule.first;
    var speakerFirst = activityToCreate.speakers.first;
    if (activityToCreate.title != '' &&
        activityToCreate.description != '' &&
        activityToCreate.type != null &&
        activityToCreate.activityCode != '' &&
        scheduleFirst.date != null &&
        scheduleFirst.duration != null &&
        scheduleFirst.totalParticipants != null &&
        speakerFirst.bio != '' &&
        speakerFirst.name != '' &&
        speakerFirst.company != '') {
      return true;
    }
    return false;
  }

  @action
  Future createActivity() async {
    setIsLoading(true);
    await repository.createActivity(activityToCreate);
    await admDashboardController.getAllActivities();
    setIsLoading(false);
    Modular.to.navigate('/adm');
  }

  @action
  void setType(ActivityEnum? value) {
    activityToCreate = activityToCreate.copyWith(type: value);
  }

  @action
  void setActivityCode(String value) {
    activityToCreate = activityToCreate.copyWith(activityCode: value);
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
  void setLocation(String value, int index) {
    activityToCreate.schedule[index].location = value;
  }

  @action
  void setLink(String value, int index) {
    activityToCreate.schedule[index].link = value;
  }

  @action
  void setDate(String value, int index) {
    if (value.length > 9) {
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
    if (value.length > 4) {
      var date = activityToCreate.schedule[index].date != null
          ? DateFormat('yyyy-MM-dd')
              .format(activityToCreate.schedule[index].date!)
          : '0000-00-00';
      var hour = DateTime.parse("$date $value");
      var list = activityToCreate.schedule;
      list[index] = activityToCreate.schedule[index].copyWith(date: hour);
      activityToCreate = activityToCreate.copyWith(schedule: list);
    }
  }

  @action
  void setDuration(String value, int index) {
    if (value.length >= 5) {
      var duration = DateFormat('HH:mm').parse(value);
      var list = activityToCreate.schedule;
      list[index] =
          activityToCreate.schedule[index].copyWith(duration: duration);
      activityToCreate = activityToCreate.copyWith(schedule: list);
    }
  }

  @action
  void setParticipants(int value, int index) {
    activityToCreate.schedule[index].totalParticipants = value;
  }

  @action
  void setSpeakerName(String value, int index) {
    activityToCreate.speakers[index].name = value;
  }

  @action
  void setSpeakerBio(String value, int index) {
    activityToCreate.speakers[index].bio = value;
  }

  @action
  void setSpeakerCompany(String value, int index) {
    activityToCreate.speakers[index].company = value;
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

  @action
  void addSpeaker() {
    var list = activityToCreate.speakers;
    list.add(SpeakerActivityModel.newInstance());
    activityToCreate = activityToCreate.copyWith(speakers: list);
  }

  @action
  void removeSpeaker(int index) {
    var list = activityToCreate.speakers;
    list.removeAt(index);
    activityToCreate = activityToCreate.copyWith(speakers: list);
  }
}
