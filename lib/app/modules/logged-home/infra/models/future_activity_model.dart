// ignore_for_file: annotate_overrides, overridden_fields, duplicate_ignore

import 'dart:convert';

import 'package:smile_front/app/modules/logged-home/domain/entities/future_activity.dart';

class FutureActivityModel extends FutureActivity {
  // ignore: annotate_overrides, overridden_fields
  final String activityName;
  // ignore: annotate_overrides, overridden_fields
  final String activityDate;
  final String activityTime;
  final String? activityRemainTime;

  FutureActivityModel(
      {required this.activityName,
      required this.activityDate,
      required this.activityTime,
      this.activityRemainTime})
      : super(
            activityDate: activityDate,
            activityName: activityName,
            activityTime: activityTime,
            activityRemainTime: activityRemainTime);

  Map<String, dynamic> toMap() {
    return {
      'activityName': activityName,
      'activityDate': activityDate,
      'activityTime': activityTime,
      'activityRemainTime': activityRemainTime,
    };
  }

  factory FutureActivityModel.fromMap(Map<String, dynamic> map) {
    return FutureActivityModel(
      activityName: map['activityName'] ?? '',
      activityDate: map['activityDate'] ?? '',
      activityTime: map['activityTime'] ?? '',
      activityRemainTime: map['activityRemainTime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FutureActivityModel.fromJson(String source) =>
      FutureActivityModel.fromMap(json.decode(source));
}
