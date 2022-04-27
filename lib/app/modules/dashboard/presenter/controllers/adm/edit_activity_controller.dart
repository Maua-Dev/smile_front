import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/schedule_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import '../../../domain/repositories/activities_repository_interface.dart';

part 'edit_activity_controller.g.dart';

class EditActivityController = _EditActivityControllerBase
    with _$EditActivityController;

abstract class _EditActivityControllerBase with Store {
  final ActivitiesRepositoryInterface repository;
  final ActivityModel activityModel;

  _EditActivityControllerBase({
    required this.repository,
    required this.activityModel,
  }) {
    if (activityModel.id.isEmpty) {
      Modular.to.navigate('/adm');
    }
  }

  @observable
  late var activityToEdit = activityModel;

  @observable
  bool isLoading = false;

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @action
  bool isFilled() {
    var scheduleFirst = activityToEdit.schedule.first;
    if (activityToEdit.title != '' &&
        activityToEdit.description != '' &&
        activityToEdit.type != null &&
        activityToEdit.activityCode != '' &&
        scheduleFirst.date != null &&
        scheduleFirst.duration != null &&
        scheduleFirst.totalParticipants != null) {
      return true;
    }
    return false;
  }

  @action
  Future editActivity() async {
    setIsLoading(true);
    await repository.editActivity(activityToEdit);
    setIsLoading(false);
    Modular.to.navigate('/adm');
  }

  @action
  Future deleteActivity(String id) async {
    setIsLoading(true);
    await repository.removeActivity(id);
    setIsLoading(false);
    Modular.to.navigate('/adm');
  }

  @action
  void setType(ActivityEnum? value) {
    activityToEdit = activityToEdit.copyWith(type: value);
  }

  @action
  void setActivityCode(String value) {
    activityToEdit = activityToEdit.copyWith(activityCode: value);
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
  void setLocation(String value, int index) {
    activityToEdit.schedule[index].location = value;
  }

  @action
  void setLink(String value, int index) {
    activityToEdit.schedule[index].link = value;
  }

  @action
  void setDate(String value, int index) {
    if (value.length > 9) {
      var year = value.substring(6, 10);
      var month = value.substring(3, 5);
      var day = value.substring(0, 2);
      value = '$year-$month-$day';
      var hour = activityToEdit.schedule[index].date != null
          ? DateFormat('HH:mm').format(activityToEdit.schedule[index].date!)
          : '';
      var date =
          hour == '' ? DateTime.parse(value) : DateTime.parse("$value $hour");
      var list = activityToEdit.schedule;
      list[index] = activityToEdit.schedule[index].copyWith(date: date);
      activityToEdit = activityToEdit.copyWith(schedule: list);
    }
  }

  @action
  void setHour(String value, int index) {
    if (value.length > 4) {
      var date = activityToEdit.schedule[index].date != null
          ? DateFormat('yyyy-MM-dd')
              .format(activityToEdit.schedule[index].date!)
          : '0000-00-00';
      var hour = DateTime.parse("$date $value");
      var list = activityToEdit.schedule;
      list[index] = activityToEdit.schedule[index].copyWith(date: hour);
      activityToEdit = activityToEdit.copyWith(schedule: list);
    }
  }

  @action
  void setDuration(String value, int index) {
    if (value.length >= 5) {
      var format = DateFormat('HH:mm');
      var duration = format.parse(value);
      var list = activityToEdit.schedule;
      list[index] = activityToEdit.schedule[index].copyWith(duration: duration);
      activityToEdit = activityToEdit.copyWith(schedule: list);
    }
  }

  @action
  void setParticipants(int value, int index) {
    activityToEdit.schedule[index].totalParticipants = value;
  }

  @action
  void setSpeakerName(String value, int index) {
    activityToEdit.speakers[index].name = value;
  }

  @action
  void setSpeakerBio(String value, int index) {
    activityToEdit.speakers[index].bio = value;
  }

  @action
  void setSpeakerCompany(String value, int index) {
    activityToEdit.speakers[index].company = value;
  }

  @action
  void setEnableSubscription(bool value, int index) {
    activityToEdit.schedule[index].acceptSubscription = value;
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

  @action
  void addSpeaker() {
    var list = activityToEdit.speakers;
    list.add(SpeakerActivityModel.newInstance());
    activityToEdit = activityToEdit.copyWith(speakers: list);
  }

  @action
  void removeSpeaker(int index) {
    var list = activityToEdit.speakers;
    list.removeAt(index);
    activityToEdit = activityToEdit.copyWith(speakers: list);
  }
}
