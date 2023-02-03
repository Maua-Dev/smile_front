import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/edit_activity.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

import '../../../../../shared/entities/infra/delivery_enum.dart';

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
    if (activityModel.activityCode.isEmpty) {
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
    if (activityToEdit.title != '' &&
        activityToEdit.description != '' &&
        activityToEdit.type != null &&
        activityToEdit.deliveryEnum != null &&
        activityToEdit.activityCode != '' &&
        activityToEdit.startDate != null) {
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
  void setModality(DeliveryEnum? value) {
    activityToEdit = activityToEdit.copyWith(deliveryEnum: value);
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
  void setLocation(String value) {
    activityToEdit.place = value;
  }

  @action
  void setLink(String value) {
    activityToEdit.link = value;
  }

  @action
  void setDate(String value) {
    if (value.length > 9) {
      var year = value.substring(6, 10);
      var month = value.substring(3, 5);
      var day = value.substring(0, 2);
      value = '$year-$month-$day';
      var hour = activityToEdit.startDate != null
          ? DateFormat('HH:mm').format(activityToEdit.startDate!)
          : '';
      var date =
          hour == '' ? DateTime.parse(value) : DateTime.parse("$value $hour");
      activityToEdit = activityToEdit.copyWith(startDate: date);
    }
  }

  @action
  void setHour(String value) {
    if (value.length > 4) {
      var date = activityToEdit.startDate != null
          ? DateFormat('yyyy-MM-dd').format(activityToEdit.startDate!)
          : '0000-00-00';
      var hour = DateTime.parse("$date $value");

      activityToEdit = activityToEdit.copyWith(startDate: hour);
    }
  }

  @action
  void setDuration(String value) {
    var format = int.parse(value);
    activityToEdit = activityToEdit.copyWith(duration: format);
  }

  @action
  void setParticipants(int value) {
    activityToEdit = activityToEdit.copyWith(totalSlots: value);
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
  void setEnableSubscription(bool value) {
    activityToEdit = activityToEdit.copyWith(acceptingNewEnrollments: value);
  }

  @action
  void setIsExtensive() {
    activityToEdit.isExtensive = !activityToEdit.isExtensive;
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
