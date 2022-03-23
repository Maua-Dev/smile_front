import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/schedule_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/adm_dashboard_controller.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import '../../../domain/repositories/activities_repository_interface.dart';

part 'edit_activity_controller.g.dart';

class EditActivityController = _EditActivityControllerBase
    with _$EditActivityController;

abstract class _EditActivityControllerBase with Store {
  final ActivitiesRepositoryInterface repository;
  final ActivityModel activityModel;
  final admDashboardController = Modular.get<AdmDashboardController>();

  _EditActivityControllerBase({
    required this.repository,
    required this.activityModel,
  }) {
    if (activityModel.id.isEmpty) {
      Modular.to.navigate('/adm');
    }
    startSchedule();
  }

  @observable
  late var activityToEdit = activityModel;

  @observable
  bool isLoading = false;

  @observable
  bool isOnline = false;

  @observable
  bool isInPerson = false;

  @action
  Future<void> setIsOnline(bool value) async {
    isOnline = value;
  }

  @action
  Future<void> setIsInPerson(bool value) async {
    isInPerson = value;
  }

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @action
  void startSchedule() {
    if (activityToEdit.schedule[0].location != null &&
        activityToEdit.schedule[0].location != '') {
      setIsInPerson(true);
    }
    if (activityToEdit.schedule[0].link != null &&
        activityToEdit.schedule[0].link != '') {
      setIsOnline(true);
    }
  }

  @action
  bool isFilled() {
    var scheduleFirst = activityToEdit.schedule.first;
    var speakerFirst = activityToEdit.speaker.first;
    if (activityToEdit.title != '' &&
        activityToEdit.description != '' &&
        activityToEdit.type != null &&
        activityToEdit.activityCode != '' &&
        scheduleFirst.date != null &&
        scheduleFirst.duration != null &&
        scheduleFirst.totalParticipants != null &&
        speakerFirst.bio != '' &&
        speakerFirst.name != '' &&
        speakerFirst.company != '' &&
        activityToEdit.linkPhoto != null) {
      return true;
    }
    return false;
  }

  @action
  Future editActivity() async {
    setIsLoading(true);
    await repository.editActivity(activityToEdit);
    await admDashboardController.getAllActivities();
    setIsLoading(false);
    Modular.to.navigate('/adm');
  }

  @action
  Future deleteActivity(String id) async {
    await repository.removeActivity(id);
    await admDashboardController.getAllActivities();
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
  void setDate(DateTime value, int index) {
    var dateValue = DateFormat('yyyy-MM-dd').format(value);
    var hour = activityToEdit.schedule[index].date != null
        ? DateFormat('HH:mm').format(activityToEdit.schedule[index].date!)
        : '';
    var date = hour == '' ? value : DateTime.parse("$dateValue $hour");
    var list = activityToEdit.schedule;
    list[index] = activityToEdit.schedule[index].copyWith(date: date);
    activityToEdit = activityToEdit.copyWith(schedule: list);
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
    activityToEdit.speaker[index].name = value;
  }

  @action
  void setSpeakerBio(String value, int index) {
    activityToEdit.speaker[index].bio = value;
  }

  @action
  void setSpeakerCompany(String value, int index) {
    activityToEdit.speaker[index].company = value;
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
    var list = activityToEdit.speaker;
    list.add(SpeakerActivityModel.newInstance());
    activityToEdit = activityToEdit.copyWith(speaker: list);
  }

  @action
  void removeSpeaker(int index) {
    var list = activityToEdit.speaker;
    list.removeAt(index);
    activityToEdit = activityToEdit.copyWith(speaker: list);
  }
}
