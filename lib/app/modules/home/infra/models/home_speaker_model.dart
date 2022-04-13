import 'dart:convert';
import 'package:smile_front/app/shared/entities/speaker.dart';

class HomeSpeakerModel extends Speaker {
  // ignore: overridden_fields, annotate_overrides
  final String name;
  // ignore: overridden_fields, annotate_overrides
  final String bio;
  // ignore: overridden_fields, annotate_overrides
  final String? linkPhoto;

  HomeSpeakerModel({
    required this.name,
    required this.bio,
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
      'linkPhoto': linkPhoto,
    };
  }

  factory HomeSpeakerModel.fromMap(Map<String, dynamic> map) {
    return HomeSpeakerModel(
      name: map['name'] ?? '',
      bio: map['bio'] ?? '',
      linkPhoto: map['linkPhoto'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeSpeakerModel.fromJson(String source) =>
      HomeSpeakerModel.fromMap(json.decode(source));
}
