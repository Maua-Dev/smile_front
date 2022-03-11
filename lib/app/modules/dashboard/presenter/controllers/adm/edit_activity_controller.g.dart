// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_activity_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditActivityController on _EditActivityControllerBase, Store {
  final _$editActivityAsyncAction =
      AsyncAction('_EditActivityControllerBase.editActivity');

  @override
  Future<dynamic> editActivity(
      String id,
      String description,
      String link,
      int totalPlaces,
      String location,
      String name,
      DateTime date,
      ActivityEnum type,
      int workload) {
    return _$editActivityAsyncAction.run(() => super.editActivity(id,
        description, link, totalPlaces, location, name, date, type, workload));
  }

  final _$deleteActivityAsyncAction =
      AsyncAction('_EditActivityControllerBase.deleteActivity');

  @override
  Future<dynamic> deleteActivity(String id) {
    return _$deleteActivityAsyncAction.run(() => super.deleteActivity(id));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
