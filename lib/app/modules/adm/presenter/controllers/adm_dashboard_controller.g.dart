// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adm_dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdmDashboardController on AdmDashboardControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'AdmDashboardControllerBase.state', context: context);

  @override
  AdmDashboardState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(AdmDashboardState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$activitiesAdminListAtom = Atom(
      name: 'AdmDashboardControllerBase.activitiesAdminList', context: context);

  @override
  List<ActivityAdmin> get activitiesAdminList {
    _$activitiesAdminListAtom.reportRead();
    return super.activitiesAdminList;
  }

  @override
  set activitiesAdminList(List<ActivityAdmin> value) {
    _$activitiesAdminListAtom.reportWrite(value, super.activitiesAdminList, () {
      super.activitiesAdminList = value;
    });
  }

  late final _$getAdminActivitiesAsyncAction = AsyncAction(
      'AdmDashboardControllerBase.getAdminActivities',
      context: context);

  @override
  Future<void> getAdminActivities() {
    return _$getAdminActivitiesAsyncAction
        .run(() => super.getAdminActivities());
  }

  late final _$AdmDashboardControllerBaseActionController =
      ActionController(name: 'AdmDashboardControllerBase', context: context);

  @override
  void setState(AdmDashboardState value) {
    final _$actionInfo = _$AdmDashboardControllerBaseActionController
        .startAction(name: 'AdmDashboardControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$AdmDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
activitiesAdminList: ${activitiesAdminList}
    ''';
  }
}
