import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/edit_activity.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_responsible_professors.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/shared/models/admin_activity_model.dart';
import 'package:smile_front/app/shared/models/responsible_professor_model.dart';
import 'package:smile_front/generated/l10n.dart';

import '../../../../../shared/entities/infra/delivery_enum.dart';

part 'edit_activity_controller.g.dart';

class EditActivityController = EditActivityControllerBase
    with _$EditActivityController;

abstract class EditActivityControllerBase with Store {
  final AdminActivityModel activityModel;
  final EditActivityInterface editActivity;
  final GetResponsibleProfessorsInterface getResponsibleProfessors;

  EditActivityControllerBase({
    required this.activityModel,
    required this.editActivity,
    required this.getResponsibleProfessors,
  }) {
    if (activityModel.activityCode.isEmpty) {
      Modular.to.navigate('/adm');
    }
    getAllResponsibleProfessors();
  }

  @observable
  late var activityToEdit = activityModel;

  @observable
  bool isLoading = false;

  @observable
  List<ResponsibleProfessorModel>? allResponsibleProfessorsList = [];

  @action
  Future getAllResponsibleProfessors() async {
    allResponsibleProfessorsList = await getResponsibleProfessors();
  }

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @action
  String? validateRequiredField(String? value) {
    return value!.isEmpty ? S.current.fieldRequired : null;
  }

  @action
  String? isValidSubscriptionclosureDate(String? value) {
    var startDate = activityToEdit.startDate;
    var endsubscriptionsDate = activityToEdit.stopAcceptingNewEnrollmentsBefore;
    var finalDate = startDate!.add(Duration(minutes: activityToEdit.duration));

    if (endsubscriptionsDate != null) {
      var isBefore = endsubscriptionsDate.isBefore(finalDate);
      var isAtSame = endsubscriptionsDate.isAtSameMomentAs(finalDate);
      var isAtSameOrBefore = isBefore || isAtSame;

      return isAtSameOrBefore ? null : "Data inválida";
    }
    return null;
  }

  @action
  Future editUserActivity() async {
    setIsLoading(true);
    if (activityToEdit.deliveryEnum == DeliveryEnum.in_person) {
      activityToEdit.link = null;
    }
    if (activityToEdit.deliveryEnum == DeliveryEnum.online) {
      activityToEdit.place = null;
    }
    var res = await editActivity(activityToEdit);
    Modular.to.pop();
    setIsLoading(false);
    if (res) {
      Modular.to.navigate('/adm');
    }
  }

  @action
  void removeProfessor(int index) {
    var list = activityToEdit.responsibleProfessors;
    list.removeAt(index);
    activityToEdit = activityToEdit.copyWith(responsibleProfessors: list);
  }

  @action
  void setIsExtensive() {
    activityToEdit =
        activityToEdit.copyWith(isExtensive: !activityToEdit.isExtensive);
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
  void setResponsibleProfessorId(String id, int index) {
    var list = activityToEdit.responsibleProfessors;
    ResponsibleProfessorModel professor = allResponsibleProfessorsList!
        .firstWhere((professor) => professor.id == id);
    list[index] = professor;
    activityToEdit = activityToEdit.copyWith(responsibleProfessors: list);
  }

  @action
  void addResponsibleProfessor() {
    var list = activityToEdit.responsibleProfessors;
    list.add(ResponsibleProfessorModel.newInstance());
    activityToEdit = activityToEdit.copyWith(responsibleProfessors: list);
  }

  @action
  void setDate(String value) {
    if (value.length > 9) {
      var year = value.substring(6, 10);
      var month = value.substring(3, 5);
      var day = value.substring(0, 2);
      var dateFormated = '$year-$month-$day';
      var hour = activityToEdit.startDate != null
          ? DateFormat('HH:mm').format(activityToEdit.startDate!)
          : '';
      var date = hour.isEmpty
          ? DateTime.parse(dateFormated)
          : DateTime.parse("$dateFormated $hour");
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
  void setClosureDate(String value) {
    if (value.length > 9) {
      var year = value.substring(6, 10);
      var month = value.substring(3, 5);
      var day = value.substring(0, 2);
      value = '$year-$month-$day 00:00:00';
      var date = DateTime.parse(value);
      activityToEdit =
          activityToEdit.copyWith(stopAcceptingNewEnrollmentsBefore: date);
    }
  }

  @action
  void setClosureHour(String value) {
    if (value.length > 4) {
      var date = activityToEdit.stopAcceptingNewEnrollmentsBefore != null
          ? DateFormat('yyyy-MM-dd')
              .format(activityToEdit.stopAcceptingNewEnrollmentsBefore!)
          : '0000/00/00';
      var hour = DateTime.parse("$date $value");
      activityToEdit =
          activityToEdit.copyWith(stopAcceptingNewEnrollmentsBefore: hour);
    }
  }

  @action
  void setDuration(String value) {
    var format = int.parse(value);
    activityToEdit = activityToEdit.copyWith(duration: format);
  }

  @action
  void setParticipants(String value) {
    activityToEdit = activityToEdit.copyWith(totalSlots: int.parse(value));
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
