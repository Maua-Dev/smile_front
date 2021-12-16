import 'dart:convert';

import 'package:smile_front/app/modules/logged-home/domain/entities/logged_user.dart';

class LoggedUserModel extends LoggedUser {
  // ignore: overridden_fields, annotate_overrides
  final String name;

  LoggedUserModel({required this.name}) : super(name: super.name);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory LoggedUserModel.fromMap(Map<String, dynamic> map) {
    return LoggedUserModel(
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoggedUserModel.fromJson(String source) =>
      LoggedUserModel.fromMap(json.decode(source));
}
