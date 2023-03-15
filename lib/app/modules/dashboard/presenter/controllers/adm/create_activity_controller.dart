import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/create_activity.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_responsible_professors.dart';
import 'package:smile_front/app/shared/entities/infra/delivery_enum.dart';
import 'package:smile_front/app/shared/models/responsible_professor_model.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../../shared/models/activity_model.dart';
import '../../../domain/infra/activity_enum.dart';
import '../../../infra/models/speaker_activity_model.dart';

part 'create_activity_controller.g.dart';

class CreateActivityController = CreateActivityControllerBase
    with _$CreateActivityController;

abstract class CreateActivityControllerBase with Store {
  final CreateActivityInterface createActivity;
  final GetResponsibleProfessorsInterface getResponsibleProfessors;

  CreateActivityControllerBase({
    required this.createActivity,
    required this.getResponsibleProfessors,
  }) {
    getAllResponsibleProfessors();
  }

  @observable
  var activityToCreate = ActivityModel.newInstance();

  @observable
  bool isLoading = false;

  @observable
  List<ResponsibleProfessorModel>? allResponsibleProfessorsList = [];

  @observable
  ResponsibleProfessorModel? responsibleProfessor;

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
  Future createUserActivity() async {
    setIsLoading(true);
    await createActivity(activityToCreate);
    setIsLoading(false);
    Modular.to.navigate('/adm');
  }

  @action
  String? isValidSubscriptionclosureDate(String? value) {
    var startDate = activityToCreate.startDate;
    var endsubscriptionsDate =
        activityToCreate.stopAcceptingNewEnrollmentsBefore;
    var finalDate =
        startDate!.add(Duration(minutes: activityToCreate.duration));

    if (endsubscriptionsDate != null) {
      var isBefore = endsubscriptionsDate.isBefore(finalDate);
      var isAtSame = endsubscriptionsDate.isAtSameMomentAs(finalDate);
      var isAtSameOrBefore = isBefore || isAtSame;

      return isAtSameOrBefore ? null : "Data inválida";
    }
    return null;
  }

  @action
  void setModality(DeliveryEnum? value) {
    activityToCreate = activityToCreate.copyWith(deliveryEnum: value);
  }

  @action
  void setIsExtensive() {
    activityToCreate =
        activityToCreate.copyWith(isExtensive: !activityToCreate.isExtensive);
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
  void setResponsibleProfessorId(String id) {
    ResponsibleProfessorModel professor = allResponsibleProfessorsList!
        .firstWhere((professor) => professor.id == id);
    responsibleProfessor = professor;
  }

  @action
  void setDescription(String value) {
    activityToCreate = activityToCreate.copyWith(description: value);
  }

  @action
  void setLocation(String value) {
    activityToCreate.place = value;
  }

  @action
  void setLink(String value) {
    activityToCreate.link = value;
  }

  @action
  void setDate(String value) {
    if (value.length > 9) {
      var year = value.substring(6, 10);
      var month = value.substring(3, 5);
      var day = value.substring(0, 2);
      var dateFormated = '$year-$month-$day';
      var hour = activityToCreate.startDate != null
          ? DateFormat('HH:mm').format(activityToCreate.startDate!)
          : '';
      var date = hour.isEmpty
          ? DateTime.parse(dateFormated)
          : DateTime.parse("$dateFormated $hour");
      activityToCreate = activityToCreate.copyWith(startDate: date);
    }
  }

  @action
  void setHour(String value) {
    if (value.length > 4) {
      var date = activityToCreate.startDate != null
          ? DateFormat('yyyy-MM-dd').format(activityToCreate.startDate!)
          : '0000-00-00';
      var hour = DateTime.parse("$date $value");
      activityToCreate = activityToCreate.copyWith(startDate: hour);
    }
  }

  @action
  void setDuration(String value) {
    var duration = int.parse(value);
    activityToCreate = activityToCreate.copyWith(duration: duration);
  }

  @action
  void setClosureDate(String value) {
    if (value.length > 9) {
      var year = value.substring(6, 10);
      var month = value.substring(3, 5);
      var day = value.substring(0, 2);
      value = '$year-$month-$day 00:00:00';
      var date = DateTime.parse(value);
      activityToCreate =
          activityToCreate.copyWith(stopAcceptingNewEnrollmentsBefore: date);
    }
  }

  @action
  void setClosureHour(String value) {
    if (value.length > 4) {
      var date = activityToCreate.stopAcceptingNewEnrollmentsBefore != null
          ? DateFormat('yyyy-MM-dd')
              .format(activityToCreate.stopAcceptingNewEnrollmentsBefore!)
          : '0000/00/00';
      var hour = DateTime.parse("$date $value");
      activityToCreate =
          activityToCreate.copyWith(stopAcceptingNewEnrollmentsBefore: hour);
    }
  }

  @action
  void setParticipants(String value) {
    activityToCreate = activityToCreate.copyWith(totalSlots: int.parse(value));
  }

  @action
  void setEnableSubscription(bool value) {
    activityToCreate =
        activityToCreate.copyWith(acceptingNewEnrollments: value);
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
