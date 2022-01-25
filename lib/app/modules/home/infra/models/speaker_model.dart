import 'dart:convert';
import 'package:smile_front/app/modules/home/domain/entities/speaker.dart';

class SpeakerModel extends Speaker {
  // ignore: annotate_overrides, overridden_fields
  final String name;
  // ignore: annotate_overrides, overridden_fields
  final String description;
  // ignore: annotate_overrides, overridden_fields
  final String date;
  // ignore: annotate_overrides, overridden_fields
  final String linkPhoto;

  SpeakerModel(
      {required this.name,
      required this.description,
      required this.date,
      required this.linkPhoto})
      : super(
          name: name,
          description: description,
          date: date,
          linkPhoto: linkPhoto,
        );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'date': date,
      'linkPhoto': linkPhoto,
    };
  }

  factory SpeakerModel.fromMap(Map<String, dynamic> map) {
    return SpeakerModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      date: map['date'] ?? '',
      linkPhoto: map['linkPhoto'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SpeakerModel.fromJson(String source) =>
      SpeakerModel.fromMap(json.decode(source));
}
