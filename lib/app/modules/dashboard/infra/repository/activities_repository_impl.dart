import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource_interface.dart';
import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import 'package:smile_front/app/shared/models/professor_activity_model.dart';

import '../../../../shared/models/enrollments_model.dart';
import '../../../../shared/models/enrolls_activity_model.dart';

import 'package:smile_front/app/shared/models/admin_activity_model.dart';

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
    if (activityWithEnrollments.enrollments != null) {
      activityWithEnrollments =
          await datasource.getActivityWithEnrollments(code);
    }
    return Future.value(activityWithEnrollments);
  }

  @override
  Future editActivity(ActivityModel activityToEdit) async {
    var index = activitiesList.indexWhere(
        (element) => element.activityCode == activityToEdit.activityCode);
    activitiesList.removeAt(index);
    activitiesList.insert(index, activityToEdit);
    await datasource.editActivity(activityToEdit.activityCode, activityToEdit);
  }

  @override
  Future deleteActivity(String activityCode) async {
    activitiesList
        .removeWhere((element) => element.activityCode == activityCode);
    await datasource.deleteActivity(activityCode);
  }

  @override
  Future createActivity(ActivityModel activityToCreate) async {
    activitiesList.insert(0, activityToCreate);
    await datasource.createActivity(activityToCreate);
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
  Future postManualChangeAttendance(
      String activityCode, String userId, EnrollmentStateEnum state) async {
    var requestDone = await datasource.postManualChangeAttendance(
        activityCode, userId, state);
    var index = activityWithEnrollments.enrollments!
        .indexWhere((element) => element.userEnroll!.userId == userId);
    var enrollmentsList = activityWithEnrollments.enrollments;
    enrollmentsList!
        .removeWhere((element) => element.userEnroll!.userId == userId);
    enrollmentsList.insert(index, requestDone.enrollments![index]);
    activityWithEnrollments = ProfessorActivityModel(
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
  }
}
