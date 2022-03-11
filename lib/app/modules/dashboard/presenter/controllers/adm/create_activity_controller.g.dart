// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_activity_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateActivityController on _CreateActivityControllerBase, Store {
  final _$createActivityAsyncAction =
      AsyncAction('_CreateActivityControllerBase.createActivity');

  @override
  Future<dynamic> createActivity(
      String id,
      ActivityEnum type,
      String title,
      String description,
      DateTime date,
      DateTime hour,
      String location,
      int totalParticipants,
      SpeakerActivityModel speaker) {
    return _$createActivityAsyncAction.run(() => super.createActivity(id, type,
        title, description, date, hour, location, totalParticipants, speaker));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
