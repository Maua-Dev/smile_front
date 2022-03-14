import 'package:smile_front/app/shared/entities/speaker.dart';
import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'bio': bio,
      'company': company,
      'linkPhoto': linkPhoto,
    };
  }

  factory SpeakerActivityModel.fromMap(Map<String, dynamic> map) {
    return SpeakerActivityModel(
      name: map['name'] ?? '',
      bio: map['bio'] ?? '',
      company: map['company'] ?? '',
      linkPhoto: map['linkPhoto'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SpeakerActivityModel.fromJson(String source) =>
      SpeakerActivityModel.fromMap(json.decode(source));
}
