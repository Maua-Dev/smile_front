// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'more_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MoreInfoController on MoreInfoControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'MoreInfoControllerBase.isLoading', context: context);

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

  late final _$isLoadingConfirmAttendanceAtom = Atom(
      name: 'MoreInfoControllerBase.isLoadingConfirmAttendance',
      context: context);

  @override
  bool get isLoadingConfirmAttendance {
    _$isLoadingConfirmAttendanceAtom.reportRead();
    return super.isLoadingConfirmAttendance;
  }

  @override
  set isLoadingConfirmAttendance(bool value) {
    _$isLoadingConfirmAttendanceAtom
        .reportWrite(value, super.isLoadingConfirmAttendance, () {
      super.isLoadingConfirmAttendance = value;
    });
  }

  late final _$enrollmentStateAtom =
      Atom(name: 'MoreInfoControllerBase.enrollmentState', context: context);

  @override
  EnrollmentStateEnum get enrollmentState {
    _$enrollmentStateAtom.reportRead();
    return super.enrollmentState;
  }

  @override
  set enrollmentState(EnrollmentStateEnum value) {
    _$enrollmentStateAtom.reportWrite(value, super.enrollmentState, () {
      super.enrollmentState = value;
    });
  }

  late final _$canViewConfirmAttendanceAtom = Atom(
      name: 'MoreInfoControllerBase.canViewConfirmAttendance',
      context: context);

  @override
  bool get canViewConfirmAttendance {
    _$canViewConfirmAttendanceAtom.reportRead();
    return super.canViewConfirmAttendance;
  }

  @override
  set canViewConfirmAttendance(bool value) {
    _$canViewConfirmAttendanceAtom
        .reportWrite(value, super.canViewConfirmAttendance, () {
      super.canViewConfirmAttendance = value;
    });
  }

  late final _$activityAtom =
      Atom(name: 'MoreInfoControllerBase.activity', context: context);

  @override
  EnrollsActivityModel get activity {
    _$activityAtom.reportRead();
    return super.activity;
  }

  @override
  set activity(EnrollsActivityModel value) {
    _$activityAtom.reportWrite(value, super.activity, () {
      super.activity = value;
    });
  }

  late final _$getActivityAsyncAction =
      AsyncAction('MoreInfoControllerBase.getActivity', context: context);

  @override
  Future<dynamic> getActivity() {
    return _$getActivityAsyncAction.run(() => super.getActivity());
  }

  late final _$setIsLoadingAsyncAction =
      AsyncAction('MoreInfoControllerBase.setIsLoading', context: context);

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  late final _$setIsLoadingConfirmAttendanceAsyncAction = AsyncAction(
      'MoreInfoControllerBase.setIsLoadingConfirmAttendance',
      context: context);

  @override
  Future<void> setIsLoadingConfirmAttendance(bool value) {
    return _$setIsLoadingConfirmAttendanceAsyncAction
        .run(() => super.setIsLoadingConfirmAttendance(value));
  }

  late final _$checkCanViewConfirmAttendanceAsyncAction = AsyncAction(
      'MoreInfoControllerBase.checkCanViewConfirmAttendance',
      context: context);

  @override
  Future<void> checkCanViewConfirmAttendance() {
    return _$checkCanViewConfirmAttendanceAsyncAction
        .run(() => super.checkCanViewConfirmAttendance());
  }

  late final _$getEnrollmentStateAsyncAction = AsyncAction(
      'MoreInfoControllerBase.getEnrollmentState',
      context: context);

  @override
  Future<void> getEnrollmentState() {
    return _$getEnrollmentStateAsyncAction
        .run(() => super.getEnrollmentState());
  }

  late final _$onConfirmCodeAsyncAction =
      AsyncAction('MoreInfoControllerBase.onConfirmCode', context: context);

  @override
  Future<void> onConfirmCode(String code) {
    return _$onConfirmCodeAsyncAction.run(() => super.onConfirmCode(code));
  }

  late final _$MoreInfoControllerBaseActionController =
      ActionController(name: 'MoreInfoControllerBase', context: context);

  @override
  bool checkIsOkForSubscribe() {
    final _$actionInfo = _$MoreInfoControllerBaseActionController.startAction(
        name: 'MoreInfoControllerBase.checkIsOkForSubscribe');
    try {
      return super.checkIsOkForSubscribe();
    } finally {
      _$MoreInfoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLoadingConfirmAttendance: ${isLoadingConfirmAttendance},
enrollmentState: ${enrollmentState},
canViewConfirmAttendance: ${canViewConfirmAttendance},
activity: ${activity}
    ''';
  }
}
