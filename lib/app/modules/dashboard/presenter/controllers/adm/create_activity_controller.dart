import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/create_activity.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../shared/entities/infra/delivery_enum.dart';
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

  /// Function that helps createUserActivity, by changing the boolean is loading.
  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  ///A function that checks if all the TITLE,DESCRIPTION,TYPE, ACTIVITY CODE, START DATE
  ///and TOTAL SLOTS are all filled, if so returns true. Else it returns false.
  @action
  String? validateRequiredField(String? value) {
    return value!.isEmpty ? S.current.fieldRequired : null;
  }

  ///A function that verifies if the subscriptionclosure date is before the event date
  ///return TRUE if the date is valid and FALSE if isnt.
  @action
  String? isValidDate(String? value) {
    var startDate = activityToCreate.startDate;
    var endsubscriptionsDate =
        activityToCreate.stopAcceptingNewEnrollmentsBefore;

    return value!.isEmpty
        ? S.current.fieldRequired
        : startDate!.isAfter(endsubscriptionsDate!)
            ? null
            : "Data inválida";
  }

  ///A function that sets the isLoading to TRUE, awaits a response,
  ///sets the loading to FALSE
  ///and then links to the /adm page.
  @action
  Future createUserActivity() async {
    setIsLoading(true);
    await createActivity(activityToCreate);
    setIsLoading(false);
    Modular.to.navigate('/adm');
  }

  ///Sets the TYPE of a activity,
  ///it receives the activityEnum with the options:
  ///* COURSE
  ///* COURSE,
  ///* LECTURES,
  ///* HIGH_IMPACT_LECTURES,
  ///* TECHNICAL_VISITS,
  ///* ACADEMIC_COMPETITIONS,
  ///* HACKATHON,
  ///* INTERNSHIP_FAIR,
  ///* ALUMNI_CAFE,
  ///* PROFESSORS_ACADEMY,
  ///* CULTURAL_ACTIVITY,
  ///* GCSP,
  ///* SPORTS_ACTIVITY
  @action
  void setType(ActivityEnum? value) {
    activityToCreate = activityToCreate.copyWith(type: value);
  }

  /// Sets the MODALITY of the activity,
  /// it receives a delivery enum with the options:
  /// * On_Person
  /// * Online
  /// * Hybrid
  @action
  void setModality(DeliveryEnum? value) {
    activityToCreate.deliveryEnum = value;
  }

  ///A function that changes the boolean variable isExtensive.
  @action
  void setIsExtensive() {
    activityToCreate =
        activityToCreate.copyWith(isExtensive: !activityToCreate.isExtensive);
  }

  ///Sets the activity CODE.
  @action
  void setActivityCode(String value) {
    activityToCreate = activityToCreate.copyWith(activityCode: value);
  }

  ///Sets the TITLE of the activity.
  @action
  void setTitle(String value) {
    activityToCreate = activityToCreate.copyWith(title: value);
  }

  ///Sets the DESCRIPTION of the activity.
  @action
  void setDescription(String value) {
    activityToCreate = activityToCreate.copyWith(description: value);
  }

  ///Sets the LOCATION in which the activity will occur.
  @action
  void setLocation(String value) {
    activityToCreate = activityToCreate.copyWith(place: value);
  }

  /// Sets the LINK of the activity, in case it's a online delivery.
  @action
  void setLink(String value) {
    activityToCreate = activityToCreate.copyWith(link: value);
  }

  ///Sets the DATE the activity will occur.
  @action
  void setDate(String value) {
    if (value.length > 9) {
      var year = value.substring(6, 10);
      var month = value.substring(3, 5);
      var day = value.substring(0, 2);
      value = '$year/$month/$day';
      var hour = activityToCreate.startDate != null
          ? DateFormat('HH:mm').format(activityToCreate.startDate!)
          : '';
      var date =
          hour == '' ? DateTime.parse(value) : DateTime.parse("$value $hour");
      activityToCreate = activityToCreate.copyWith(startDate: date);
    }
  }

  ///Sets the DATE for the activity to not receive more subscriptions.
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

  ///It sets the HOUR which the activity will occur.
  @action
  void setHour(String value) {
    if (value.length > 4) {
      var date = activityToCreate.startDate != null
          ? DateFormat('yyyy/MM/dd').format(activityToCreate.startDate!)
          : '0000/00/00';
      var hour = DateTime.parse("$date $value");
      activityToCreate = activityToCreate.copyWith(startDate: hour);
    }
  }

  ///It sets the hour for the inscriptions to a activity to close.
  @action
  void setClosureHour(String value) {
    if (value.length > 4) {
      var date = activityToCreate.stopAcceptingNewEnrollmentsBefore != null
          ? DateFormat('yyyy/MM/dd')
              .format(activityToCreate.stopAcceptingNewEnrollmentsBefore!)
          : '0000/00/00';
      var hour = DateTime.parse("$date $value");
      activityToCreate =
          activityToCreate.copyWith(stopAcceptingNewEnrollmentsBefore: hour);
    }
  }

  ///Sets the event duration, in minutes.
  @action
  void setDuration(String value) {
    activityToCreate = activityToCreate.copyWith(duration: int.parse(value));
  }

  ///Sets the number of participants of the event.
  @action
  void setParticipants(String value) {
    activityToCreate = activityToCreate.copyWith(totalSlots: int.parse(value));
  }

  ///A function that changes the variable acceptingNewEnrollments,
  ///which is used to enable subscriptions on a certain activity.
  @action
  void setEnableSubscription(bool value) {
    activityToCreate =
        activityToCreate.copyWith(acceptingNewEnrollments: value);
  }

  /// Sets the name of the speaker of the activity
  @action
  void setSpeakerName(String value, int index) {
    activityToCreate.speakers[index].name = value;
  }

  ///Sets the bio of the speaker
  @action
  void setSpeakerBio(String value, int index) {
    activityToCreate.speakers[index].bio = value;
  }

  /// Sets the working company of the speaker
  @action
  void setSpeakerCompany(String value, int index) {
    activityToCreate.speakers[index].company = value;
  }

  ///Add a new speaker to the speaker list
  @action
  void addSpeaker() {
    var list = activityToCreate.speakers;
    list.add(SpeakerActivityModel.newInstance());
    activityToCreate = activityToCreate.copyWith(speakers: list);
  }

  ///Removes a speaker from the speakers list
  @action
  void removeSpeaker(int index) {
    var list = activityToCreate.speakers;
    list.removeAt(index);
    activityToCreate = activityToCreate.copyWith(speakers: list);
  }
}
