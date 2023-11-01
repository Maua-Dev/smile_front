import 'package:smile_front/app/modules/adm/domain/entities/activity_admin.dart';

class ActivityAdminModel extends ActivityAdmin {
  ActivityAdminModel({
    required super.activityCode,
    required super.title,
    required super.type,
    required super.responsibleProfessors,
    required super.place,
    required super.link,
    required super.deliveryEnum,
    required super.description,
    required super.isExtensive,
    required super.startDate,
    required super.duration,
    required super.totalSlots,
    required super.takenSlots,
    required super.speakers,
    required super.stopAcceptingNewEnrollmentsBefore,
    required super.acceptingNewEnrollments,
  });

  factory ActivityAdminModel.fromJson(Map<String, dynamic> json) {
    return ActivityAdminModel(
      activityCode: json['activityCode'],
      title: json['title'],
      type: json['type'],
      responsibleProfessors: json['responsibleProfessors'],
      place: json['place'],
      link: json['link'],
      deliveryEnum: json['deliveryEnum'],
      description: json['description'],
      isExtensive: json['isExtensive'],
      //timestamp = valor interno
      startDate: DateTime.parse(json['startDate']),
      duration: json['duration'],
      totalSlots: json['totalSlots'],
      takenSlots: json['takenSlots'],
      speakers: json['speakers'],
      //timestamp = valor interno
      stopAcceptingNewEnrollmentsBefore:
          DateTime.parse(json['stopAcceptingNewEnrollmentsBefore']),
      acceptingNewEnrollments: json['acceptingNewEnrollments'],
    );
  }
}
