// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoggedHomeController on _LoggedHomeControllerBase, Store {
  final _$userAtom = Atom(name: '_LoggedHomeControllerBase.user');

  @override
  LoggedUser get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(LoggedUser value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$activityAtom = Atom(name: '_LoggedHomeControllerBase.activity');

  @override
  FutureActivity get activity {
    _$activityAtom.reportRead();
    return super.activity;
  }

  @override
  set activity(FutureActivity value) {
    _$activityAtom.reportWrite(value, super.activity, () {
      super.activity = value;
    });
  }

  final _$getUserAsyncAction = AsyncAction('_LoggedHomeControllerBase.getUser');

  @override
  Future<dynamic> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$getActivityAsyncAction =
      AsyncAction('_LoggedHomeControllerBase.getActivity');

  @override
  Future<dynamic> getActivity() {
    return _$getActivityAsyncAction.run(() => super.getActivity());
  }

  @override
  String toString() {
    return '''
user: ${user},
activity: ${activity}
    ''';
  }
}
