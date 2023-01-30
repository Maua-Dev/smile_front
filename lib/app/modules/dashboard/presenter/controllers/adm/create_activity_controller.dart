import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/create_activity.dart';
import '../../../../../shared/models/activity_model.dart';
import '../../../domain/infra/activity_enum.dart';
import '../../../infra/models/speaker_activity_model.dart';

part 'create_activity_controller.g.dart';

class CreateActivityController = CreateActivityControllerBase
    with _$CreateActivityController;

abstract class CreateActivityControllerBase with Store {
  final CreateActivityInterface createActivity;

  CreateActivityControllerBase({
    required this.createActivity,
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
    if (activityToCreate.title != '' &&
        activityToCreate.description != '' &&
        activityToCreate.type != null &&
        activityToCreate.activityCode != '' &&
        activityToCreate.startDate != null &&
        activityToCreate.totalSlots != 0) {
      return true;
    }
    return false;
  }

  @action
  Future createUserActivity() async {
    setIsLoading(true);
    await createActivity(activityToCreate);
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
    activityToCreate.place = value;
  }

  @action
  void setLink(String value, int index) {
    activityToCreate.link = value;
  }

  @action
  void setDate(String value, int index) {
    if (value.length > 9) {
      var year = value.substring(6, 10);
      var month = value.substring(3, 5);
      var day = value.substring(0, 2);
      value = '$year-$month-$day';
      var hour = activityToCreate.startDate != null
          ? DateFormat('HH:mm').format(activityToCreate.startDate!)
          : '';
      var date =
          hour == '' ? DateTime.parse(value) : DateTime.parse("$value $hour");
      activityToCreate = activityToCreate.copyWith(startDate: date);
    }
  }

  @action
  void setHour(String value, int index) {
    if (value.length > 4) {
      var date = activityToCreate.startDate != null
          ? DateFormat('yyyy-MM-dd').format(activityToCreate.startDate!)
          : '0000-00-00';
      var hour = DateTime.parse("$date $value");
      activityToCreate = activityToCreate.copyWith(startDate: hour);
    }
  }

  @action
  void setDuration(String value, int index) {
    if (value.length >= 5) {
      var duration = int.parse(value);
      activityToCreate = activityToCreate.copyWith(duration: duration);
    }
  }

  @action
  void setParticipants(int value, int index) {
    activityToCreate.copyWith(totalSlots: value);
  }

  @action
  void setEnableSubscription(bool value, int index) {
    activityToCreate.copyWith(acceptingNewEnrollments: value);
  }

  @action
  void setSpeakerName(String value, int index) {
    activityToCreate.speakers[index].copyWith(name: value);
  }

  @action
  void setSpeakerBio(String value, int index) {
    activityToCreate.speakers[index].copyWith(bio: value);
  }

  @action
  void setSpeakerCompany(String value, int index) {
    activityToCreate.speakers[index].copyWith(company: value);
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
