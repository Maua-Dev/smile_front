// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribed_activities_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SubscribedActivitiesController
    on SubscribedActivitiesControllerBase, Store {
  final _$activitiesListAtom =
      Atom(name: 'SubscribedActivitiesControllerBase.activitiesList');

  @override
  List<Activity> get activitiesList {
    _$activitiesListAtom.reportRead();
    return super.activitiesList;
  }

  @override
  set activitiesList(List<Activity> value) {
    _$activitiesListAtom.reportWrite(value, super.activitiesList, () {
      super.activitiesList = value;
    });
  }

  final _$getSubscribedActivitiesAsyncAction =
      AsyncAction('SubscribedActivitiesControllerBase.getSubscribedActivities');

  @override
  Future<dynamic> getSubscribedActivities() {
    return _$getSubscribedActivitiesAsyncAction
        .run(() => super.getSubscribedActivities());
  }

  final _$unsubscribeActivityAsyncAction =
      AsyncAction('SubscribedActivitiesControllerBase.unsubscribeActivity');

  @override
  Future<dynamic> unsubscribeActivity(String activityId, String userId) {
    return _$unsubscribeActivityAsyncAction
        .run(() => super.unsubscribeActivity(activityId, userId));
  }

  final _$SubscribedActivitiesControllerBaseActionController =
      ActionController(name: 'SubscribedActivitiesControllerBase');

  @override
  void orderByDate() {
    final _$actionInfo = _$SubscribedActivitiesControllerBaseActionController
        .startAction(name: 'SubscribedActivitiesControllerBase.orderByDate');
    try {
      return super.orderByDate();
    } finally {
      _$SubscribedActivitiesControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void orderByParticipants() {
    final _$actionInfo =
        _$SubscribedActivitiesControllerBaseActionController.startAction(
            name: 'SubscribedActivitiesControllerBase.orderByParticipants');
    try {
      return super.orderByParticipants();
    } finally {
      _$SubscribedActivitiesControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activitiesList: ${activitiesList}
    ''';
  }
}
