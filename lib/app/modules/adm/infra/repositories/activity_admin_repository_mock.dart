import 'package:dartz/dartz.dart';
import 'package:smile_front/app/modules/adm/domain/repositories/activity_admin_repository_interface.dart';
import 'package:smile_front/app/modules/adm/infra/models/activity_admin_model.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/shared/helpers/errors/errors.dart';
import 'package:smile_front/app/shared/domain/enum/delivery_enum.dart';

class ActivityAdminRepositoryMock implements ActivityAdminRepositoryInterface {
  List<ActivityAdminModel> listActivitiesAdmin = [
    ActivityAdminModel(
      activityCode: '123',
      title: 'teste',
      type: ActivityEnum.COURSES,
      responsibleProfessors: [],
      place: '',
      link: '',
      deliveryEnum: DeliveryEnum.ONLINE,
      description: '',
      isExtensive: false,
      startDate: DateTime.now(),
      duration: 0,
      totalSlots: 0,
      takenSlots: 0,
      speakers: [],
      stopAcceptingNewEnrollmentsBefore: DateTime.now(),
      acceptingNewEnrollments: true,
    ),
    ActivityAdminModel(
      activityCode: '123',
      title: 'teste',
      type: ActivityEnum.COURSES,
      responsibleProfessors: [],
      place: '',
      link: '',
      deliveryEnum: DeliveryEnum.ONLINE,
      description: '',
      isExtensive: false,
      startDate: DateTime.now(),
      duration: 0,
      totalSlots: 0,
      takenSlots: 0,
      speakers: [],
      stopAcceptingNewEnrollmentsBefore: DateTime.now(),
      acceptingNewEnrollments: true,
    )
  ];

  @override
  Future<Either<Failure, List<ActivityAdminModel>>>
      getAllAdminActivities() async {
    return right(listActivitiesAdmin);
  }
}
