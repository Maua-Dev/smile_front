// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_subscription_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserEnrollmentController on UserEnrollmentControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'UserEnrollmentControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$subscribedActivitiesAtom = Atom(
      name: 'UserEnrollmentControllerBase.subscribedActivities',
      context: context);

  @override
  List<EnrollsActivityModel> get subscribedActivities {
    _$subscribedActivitiesAtom.reportRead();
    return super.subscribedActivities;
  }

  @override
  set subscribedActivities(List<EnrollsActivityModel> value) {
    _$subscribedActivitiesAtom.reportWrite(value, super.subscribedActivities,
        () {
      super.subscribedActivities = value;
    });
  }

  late final _$allActivitiesWithEnrollmentsAtom = Atom(
      name: 'UserEnrollmentControllerBase.allActivitiesWithEnrollments',
      context: context);

  @override
  List<EnrollsActivityModel> get allActivitiesWithEnrollments {
    _$allActivitiesWithEnrollmentsAtom.reportRead();
    return super.allActivitiesWithEnrollments;
  }

  @override
  set allActivitiesWithEnrollments(List<EnrollsActivityModel> value) {
    _$allActivitiesWithEnrollmentsAtom
        .reportWrite(value, super.allActivitiesWithEnrollments, () {
      super.allActivitiesWithEnrollments = value;
    });
  }

  late final _$getUserAllActivitiesWithEnrollmentAsyncAction = AsyncAction(
      'UserEnrollmentControllerBase.getUserAllActivitiesWithEnrollment',
      context: context);

  @override
  Future<dynamic> getUserAllActivitiesWithEnrollment() {
    return _$getUserAllActivitiesWithEnrollmentAsyncAction
        .run(() => super.getUserAllActivitiesWithEnrollment());
  }

  late final _$UserEnrollmentControllerBaseActionController =
      ActionController(name: 'UserEnrollmentControllerBase', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$UserEnrollmentControllerBaseActionController
        .startAction(name: 'UserEnrollmentControllerBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$UserEnrollmentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
subscribedActivities: ${subscribedActivities},
allActivitiesWithEnrollments: ${allActivitiesWithEnrollments}
    ''';
  }
}
