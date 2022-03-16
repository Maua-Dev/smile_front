import 'package:smile_front/app/shared/entities/speaker.dart';

class SpeakerActivityModel extends Speaker {
  // ignore: overridden_fields, annotate_overrides
  final String name;
  // ignore: overridden_fields, annotate_overrides
  final String bio;
  // ignore: overridden_fields, annotate_overrides
  final String? linkPhoto;
  final String company;

  SpeakerActivityModel({
    required this.name,
    required this.bio,
    required this.company,
    required this.linkPhoto,
  }) : super(
          name: name,
          bio: bio,
          linkPhoto: linkPhoto,
        );

  Map<String, dynamic> toJson() => {
        'name': name,
        'bio': bio,
        'company': company,
        'linkPhoto': linkPhoto,
      };

  factory SpeakerActivityModel.fromMap(Map<String, dynamic> map) {
    return SpeakerActivityModel(
      name: map['name'] ?? '',
      bio: map['bio'] ?? '',
      company: map['company'] ?? '',
      linkPhoto: map['linkPhoto'] ?? '',
    );
  }

  SpeakerActivityModel copyWith({
    String? name,
    String? bio,
    String? linkPhoto,
    String? company,
  }) {
    return SpeakerActivityModel(
      name: name ?? this.name,
      bio: bio ?? this.bio,
      company: company ?? this.company,
      linkPhoto: linkPhoto ?? this.linkPhoto,
    );
  }
}
