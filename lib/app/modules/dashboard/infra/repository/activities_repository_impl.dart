import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource_interface.dart';
import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';
import 'package:smile_front/app/shared/infra/models/activity_model.dart';
import 'package:smile_front/app/shared/infra/models/professor_activity_model.dart';

import '../../../../shared/infra/models/enrollments_model.dart';
import '../../../../shared/infra/models/enrolls_activity_model.dart';

import 'package:smile_front/app/shared/infra/models/admin_activity_model.dart';

class ActivitiesRepositoryImpl extends ActivitiesRepositoryInterface {
  final ActivitiesDatasourceInterface datasource;

  ActivitiesRepositoryImpl({required this.datasource});

  var activitiesList = List<ActivityModel>.empty();

  var allActivitiesAndEnrollments = List<EnrollsActivityModel>.empty();

  var admActivitiesList = List<AdminActivityModel>.empty();

  var activityWithEnrollments = ProfessorActivityModel.newInstance();

  @override
  Future<List<ActivityModel>> getAllActivities() async {
    if (activitiesList.isEmpty) {
      activitiesList = await datasource.getAllActivities();
    }
    return Future.value(activitiesList);
  }

  @override
  Future<List<EnrollsActivityModel>> getUserSubscribedActivities() async {
    if (allActivitiesAndEnrollments.isEmpty) {
      allActivitiesAndEnrollments = await datasource.getAllActivitiesLogged();
    }
    return Future.value(allActivitiesAndEnrollments);
  }

  @override
  Future<ProfessorActivityModel> getActivityWithEnrollments(String code) async {
    activityWithEnrollments = await datasource.getActivityWithEnrollments(code);
    return Future.value(activityWithEnrollments);
  }

  @override
  Future<bool> editActivity(AdminActivityModel activityToEdit) async {
    var index = admActivitiesList.indexWhere(
        (element) => element.activityCode == activityToEdit.activityCode);
    var response = await datasource.editActivity(
        activityToEdit.activityCode, activityToEdit);
    if (response != null) {
      admActivitiesList.removeAt(index);
      admActivitiesList.insert(index, activityToEdit);
      return true;
    }
    return false;
  }

  @override
  Future deleteActivity(String activityCode) async {
    admActivitiesList
        .removeWhere((element) => element.activityCode == activityCode);
    await datasource.deleteActivity(activityCode);
  }

  @override
  Future manualDropActivity(String activityCode, String userId) async {
    var requestDone = await datasource.manualDropActivity(activityCode, userId);
    var index = admActivitiesList
        .indexWhere((element) => element.activityCode == activityCode);
    var activity = AdminActivityModel(
        acceptingNewEnrollments:
            admActivitiesList[index].acceptingNewEnrollments,
        activityCode: admActivitiesList[index].activityCode,
        description: admActivitiesList[index].description,
        duration: admActivitiesList[index].duration,
        isExtensive: admActivitiesList[index].isExtensive,
        responsibleProfessors: admActivitiesList[index].responsibleProfessors,
        speakers: admActivitiesList[index].speakers,
        takenSlots: admActivitiesList[index].takenSlots,
        title: admActivitiesList[index].title,
        totalSlots: admActivitiesList[index].totalSlots,
        type: admActivitiesList[index].type,
        deliveryEnum: admActivitiesList[index].deliveryEnum,
        link: admActivitiesList[index].link,
        place: admActivitiesList[index].place,
        startDate: admActivitiesList[index].startDate,
        stopAcceptingNewEnrollmentsBefore:
            admActivitiesList[index].stopAcceptingNewEnrollmentsBefore,
        enrollments: requestDone.enrollments);
    admActivitiesList
        .removeWhere((element) => element.activityCode == activityCode);
    admActivitiesList.insert(index, activity);
  }

  @override
  Future<bool> createActivity(AdminActivityModel activityToCreate) async {
    var response = await datasource.createActivity(activityToCreate);
    if (response != null) {
      admActivitiesList.insert(0, activityToCreate);
      return true;
    }
    return false;
  }

  @override
  Future<bool> unsubscribeActivity(String activityCode) async {
    var requestDone = await datasource.postUnsubscribe(activityCode);
    if (requestDone) {
      var index = allActivitiesAndEnrollments
          .indexWhere((element) => element.activityCode == activityCode);
      var activity = EnrollsActivityModel(
        acceptingNewEnrollments:
            allActivitiesAndEnrollments[index].acceptingNewEnrollments,
        activityCode: allActivitiesAndEnrollments[index].activityCode,
        description: allActivitiesAndEnrollments[index].description,
        duration: allActivitiesAndEnrollments[index].duration,
        isExtensive: allActivitiesAndEnrollments[index].isExtensive,
        responsibleProfessors:
            allActivitiesAndEnrollments[index].responsibleProfessors,
        speakers: allActivitiesAndEnrollments[index].speakers,
        takenSlots: allActivitiesAndEnrollments[index].takenSlots,
        title: allActivitiesAndEnrollments[index].title,
        totalSlots: allActivitiesAndEnrollments[index].totalSlots,
        type: allActivitiesAndEnrollments[index].type,
        deliveryEnum: allActivitiesAndEnrollments[index].deliveryEnum,
        link: allActivitiesAndEnrollments[index].link,
        place: allActivitiesAndEnrollments[index].place,
        startDate: allActivitiesAndEnrollments[index].startDate,
        stopAcceptingNewEnrollmentsBefore: allActivitiesAndEnrollments[index]
            .stopAcceptingNewEnrollmentsBefore,
        enrollments: null,
      );
      allActivitiesAndEnrollments
          .removeWhere((element) => element.activityCode == activityCode);
      allActivitiesAndEnrollments.insert(index, activity);
    }
    return requestDone;
  }

  @override
  Future<String> getDownloadLinkCsv() async {
    var url = await datasource.getLinkCsv();
    return url;
  }

  @override
  Future<List<AdminActivityModel>> getAdminActivities() async {
    if (admActivitiesList.isEmpty) {
      admActivitiesList = await datasource.getAdminAllActivities();
    }
    return Future.value(admActivitiesList);
  }

  @override
  Future<bool> subscribeActivity(String activityCode) async {
    var requestDone = await datasource.postSubscribe(activityCode);
    if (requestDone.state != EnrollmentStateEnum.NONE) {
      var index = allActivitiesAndEnrollments
          .indexWhere((element) => element.activityCode == activityCode);
      var activity = EnrollsActivityModel(
        acceptingNewEnrollments:
            allActivitiesAndEnrollments[index].acceptingNewEnrollments,
        activityCode: allActivitiesAndEnrollments[index].activityCode,
        description: allActivitiesAndEnrollments[index].description,
        duration: allActivitiesAndEnrollments[index].duration,
        isExtensive: allActivitiesAndEnrollments[index].isExtensive,
        responsibleProfessors:
            allActivitiesAndEnrollments[index].responsibleProfessors,
        speakers: allActivitiesAndEnrollments[index].speakers,
        takenSlots: allActivitiesAndEnrollments[index].takenSlots,
        title: allActivitiesAndEnrollments[index].title,
        totalSlots: allActivitiesAndEnrollments[index].totalSlots,
        type: allActivitiesAndEnrollments[index].type,
        deliveryEnum: allActivitiesAndEnrollments[index].deliveryEnum,
        link: allActivitiesAndEnrollments[index].link,
        place: allActivitiesAndEnrollments[index].place,
        startDate: allActivitiesAndEnrollments[index].startDate,
        stopAcceptingNewEnrollmentsBefore: allActivitiesAndEnrollments[index]
            .stopAcceptingNewEnrollmentsBefore,
        enrollments: EnrollmentsModel(
          state: requestDone.state,
          dateSubscribed: requestDone.dateSubscribed,
        ),
      );
      allActivitiesAndEnrollments
          .removeWhere((element) => element.activityCode == activityCode);
      allActivitiesAndEnrollments.insert(index, activity);
      return true;
    }
    return false;
  }

  @override
  Future<ProfessorActivityModel> postManualChangeAttendance(
      String activityCode, String userId, EnrollmentStateEnum state) async {
    var requestDone = await datasource.postManualChangeAttendance(
        activityCode, userId, state);
    var index = activityWithEnrollments.enrollments!
        .indexWhere((element) => element.user!.userId == userId);
    var enrollmentsList = activityWithEnrollments.enrollments;
    enrollmentsList!.removeWhere((element) => element.user!.userId == userId);
    enrollmentsList.insert(index, requestDone.enrollments![index]);
    activityWithEnrollments = ProfessorActivityModel(
        confirmationCode: activityWithEnrollments.confirmationCode,
        acceptingNewEnrollments:
            activityWithEnrollments.acceptingNewEnrollments,
        activityCode: activityWithEnrollments.activityCode,
        description: activityWithEnrollments.description,
        duration: activityWithEnrollments.duration,
        isExtensive: activityWithEnrollments.isExtensive,
        responsibleProfessors: activityWithEnrollments.responsibleProfessors,
        speakers: activityWithEnrollments.speakers,
        takenSlots: activityWithEnrollments.takenSlots,
        title: activityWithEnrollments.title,
        totalSlots: activityWithEnrollments.totalSlots,
        type: activityWithEnrollments.type,
        deliveryEnum: activityWithEnrollments.deliveryEnum,
        link: activityWithEnrollments.link,
        place: activityWithEnrollments.place,
        startDate: activityWithEnrollments.startDate,
        stopAcceptingNewEnrollmentsBefore: allActivitiesAndEnrollments[index]
            .stopAcceptingNewEnrollmentsBefore,
        enrollments: enrollmentsList);
    return Future.value(requestDone);
  }

  @override
  Future<String> generateConfirmationCode(String activityCode) async {
    var response = await datasource.generateConfirmationCode(activityCode);

    return Future.value(response);
  }

  @override
  Future confirmAttendance(
      String confirmAttendanceCode, String activityCode) async {
    var res =
        await datasource.confirmAttendance(confirmAttendanceCode, activityCode);
    allActivitiesAndEnrollments = await datasource.getAllActivitiesLogged();
    return Future.value(res);
  }

  @override
  Future<String> deleteAtendanceCode(String activityCode) async {
    var response = await datasource.deleteAttendanceCode(activityCode);
    return Future.value(response);
  }

  @override
  Future deleteUser() async {
    await datasource.deleteUser();
  }
}
