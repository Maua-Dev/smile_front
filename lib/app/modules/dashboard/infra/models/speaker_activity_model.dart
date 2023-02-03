import 'package:smile_front/app/shared/entities/speaker.dart';

class SpeakerActivityModel extends Speaker {
  SpeakerActivityModel({
    required super.name,
    required super.bio,
    super.company,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'bio': bio,
        'company': company,
      };

  factory SpeakerActivityModel.fromMap(Map<String, dynamic> map) {
    return SpeakerActivityModel(
      name: map['name'] ?? '',
      bio: map['bio'] ?? '',
      company: map['company'] ?? '',
    );
  }
  static List<SpeakerActivityModel> fromMaps(List array) {
    return array.map((e) => SpeakerActivityModel.fromMap(e)).toList();
  }

  SpeakerActivityModel copyWith({
    String? name,
    String? bio,
    String? company,
  }) {
    return SpeakerActivityModel(
      name: name ?? this.name,
      bio: bio ?? this.bio,
      company: company ?? this.company,
    );
  }

  factory SpeakerActivityModel.newInstance() {
    return SpeakerActivityModel(
      name: '',
      bio: '',
      company: '',
    );
  }
}
