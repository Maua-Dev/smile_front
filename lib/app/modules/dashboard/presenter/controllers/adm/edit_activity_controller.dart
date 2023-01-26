import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/edit_activity.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

part 'edit_activity_controller.g.dart';

class EditActivityController = EditActivityControllerBase
    with _$EditActivityController;

abstract class EditActivityControllerBase with Store {
  final ActivityModel activityModel;
  final EditActivityInterface editActivity;

  EditActivityControllerBase({
    required this.activityModel,
    required this.editActivity,
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
    var scheduleFirst = activityToEdit.schedule;
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
  Future editUserActivity() async {
    setIsLoading(true);
    await editActivity(activityToEdit);
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
    activityToEdit.schedule.location = value;
  }

  @action
  void setLink(String value, int index) {
    activityToEdit.schedule.link = value;
  }

  @action
  void setDate(String value, int index) {
    if (value.length > 9) {
      var year = value.substring(6, 10);
      var month = value.substring(3, 5);
      var day = value.substring(0, 2);
      value = '$year-$month-$day';
      var hour = activityToEdit.schedule.date != null
          ? DateFormat('HH:mm').format(activityToEdit.schedule.date!)
          : '';
      var date =
          hour == '' ? DateTime.parse(value) : DateTime.parse("$value $hour");
      var schedule = activityToEdit.schedule;
      schedule = activityToEdit.schedule.copyWith(date: date);
      activityToEdit = activityToEdit.copyWith(schedule: schedule);
    }
  }

  @action
  void setHour(String value, int index) {
    if (value.length > 4) {
      var date = activityToEdit.schedule.date != null
          ? DateFormat('yyyy-MM-dd').format(activityToEdit.schedule.date!)
          : '0000-00-00';
      var hour = DateTime.parse("$date $value");
      var schedule = activityToEdit.schedule;
      schedule = activityToEdit.schedule.copyWith(date: hour);
      activityToEdit = activityToEdit.copyWith(schedule: schedule);
    }
  }

  @action
  void setDuration(String value, int index) {
    if (value.length >= 5) {
      var format = DateFormat('HH:mm');
      var duration = format.parse(value);
      var schedule = activityToEdit.schedule;
      schedule = activityToEdit.schedule.copyWith(duration: duration);
      activityToEdit = activityToEdit.copyWith(schedule: schedule);
    }
  }

  @action
  void setParticipants(int value, int index) {
    activityToEdit.schedule.totalParticipants = value;
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
    activityToEdit.schedule.acceptSubscription = value;
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
