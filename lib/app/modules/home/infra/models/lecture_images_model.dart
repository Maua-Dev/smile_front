import 'dart:convert';

import 'package:smile_front/app/modules/home/domain/entities/lecture_images.dart';

class LectureImagesModel extends LectureImages {
  // ignore: annotate_overrides, overridden_fields
  final String image;

  LectureImagesModel({required this.image}) : super(image: image);

  Map<String, dynamic> toMap() {
    return {
      'image': image,
    };
  }

  factory LectureImagesModel.fromMap(Map<String, dynamic> map) {
    return LectureImagesModel(
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LectureImagesModel.fromJson(String source) =>
      LectureImagesModel.fromMap(json.decode(source));
}
