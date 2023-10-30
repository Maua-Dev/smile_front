import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import '../../../modules/dashboard/infra/models/speaker_activity_model.dart';

class CardActivity {
  final String id;
  final String activityCode;
  final ActivityEnum? type;
  final String title;
  final String description;
  final DateTime? date;
  final int? totalParticipants;
  final List<SpeakerActivityModel>? speakers;
  final int? duration;
  final String? location;
  final String? link;
  final bool acceptSubscription;
  final int? enrolledUsers;
  final bool? isExtensionist;

  CardActivity(
      {required this.acceptSubscription,
      required this.enrolledUsers,
      required this.id,
      required this.activityCode,
      required this.type,
      required this.title,
      required this.description,
      required this.date,
      required this.duration,
      required this.totalParticipants,
      required this.location,
      this.speakers,
      required this.link,
      required this.isExtensionist})
      : super();

  factory CardActivity.newInstance() {
    return CardActivity(
      acceptSubscription: false,
      enrolledUsers: null,
      activityCode: '',
      description: '',
      id: '',
      title: '',
      type: null,
      date: DateTime.now(),
      duration: 0,
      link: '',
      location: '',
      speakers: [],
      totalParticipants: 0,
      isExtensionist: false,
    );
  }
}
