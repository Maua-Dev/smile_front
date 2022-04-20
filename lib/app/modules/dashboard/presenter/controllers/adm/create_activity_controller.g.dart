// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_activity_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateActivityController on _CreateActivityControllerBase, Store {
  final _$activityToCreateAtom =
      Atom(name: '_CreateActivityControllerBase.activityToCreate');

  @override
  ActivityModel get activityToCreate {
    _$activityToCreateAtom.reportRead();
    return super.activityToCreate;
  }

  @override
  set activityToCreate(ActivityModel value) {
    _$activityToCreateAtom.reportWrite(value, super.activityToCreate, () {
      super.activityToCreate = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CreateActivityControllerBase.isLoading');

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

  final _$setIsLoadingAsyncAction =
      AsyncAction('_CreateActivityControllerBase.setIsLoading');

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  final _$createActivityAsyncAction =
      AsyncAction('_CreateActivityControllerBase.createActivity');

  @override
  Future<dynamic> createActivity() {
    return _$createActivityAsyncAction.run(() => super.createActivity());
  }

  final _$_CreateActivityControllerBaseActionController =
      ActionController(name: '_CreateActivityControllerBase');

  @override
  bool isFilled() {
    final _$actionInfo = _$_CreateActivityControllerBaseActionController
        .startAction(name: '_CreateActivityControllerBase.isFilled');
    try {
      return super.isFilled();
    } finally {
      _$_CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setType(ActivityEnum? value) {
    final _$actionInfo = _$_CreateActivityControllerBaseActionController
        .startAction(name: '_CreateActivityControllerBase.setType');
    try {
      return super.setType(value);
    } finally {
      _$_CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setActivityCode(String value) {
    final _$actionInfo = _$_CreateActivityControllerBaseActionController
        .startAction(name: '_CreateActivityControllerBase.setActivityCode');
    try {
      return super.setActivityCode(value);
    } finally {
      _$_CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_CreateActivityControllerBaseActionController
        .startAction(name: '_CreateActivityControllerBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_CreateActivityControllerBaseActionController
        .startAction(name: '_CreateActivityControllerBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLocation(String value, int index) {
    final _$actionInfo = _$_CreateActivityControllerBaseActionController
        .startAction(name: '_CreateActivityControllerBase.setLocation');
    try {
      return super.setLocation(value, index);
    } finally {
      _$_CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLink(String value, int index) {
    final _$actionInfo = _$_CreateActivityControllerBaseActionController
        .startAction(name: '_CreateActivityControllerBase.setLink');
    try {
      return super.setLink(value, index);
    } finally {
      _$_CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(String value, int index) {
    final _$actionInfo = _$_CreateActivityControllerBaseActionController
        .startAction(name: '_CreateActivityControllerBase.setDate');
    try {
      return super.setDate(value, index);
    } finally {
      _$_CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHour(String value, int index) {
    final _$actionInfo = _$_CreateActivityControllerBaseActionController
        .startAction(name: '_CreateActivityControllerBase.setHour');
    try {
      return super.setHour(value, index);
    } finally {
      _$_CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDuration(String value, int index) {
    final _$actionInfo = _$_CreateActivityControllerBaseActionController
        .startAction(name: '_CreateActivityControllerBase.setDuration');
    try {
      return super.setDuration(value, index);
    } finally {
      _$_CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setParticipants(int value, int index) {
    final _$actionInfo = _$_CreateActivityControllerBaseActionController
        .startAction(name: '_CreateActivityControllerBase.setParticipants');
    try {
      return super.setParticipants(value, index);
    } finally {
      _$_CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEnableSubscription(bool value, int index) {
    final _$actionInfo =
        _$_CreateActivityControllerBaseActionController.startAction(
            name: '_CreateActivityControllerBase.setEnableSubscription');
    try {
      return super.setEnableSubscription(value, index);
    } finally {
      _$_CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpeakerName(String value, int index) {
    final _$actionInfo = _$_CreateActivityControllerBaseActionController
        .startAction(name: '_CreateActivityControllerBase.setSpeakerName');
    try {
      return super.setSpeakerName(value, index);
    } finally {
      _$_CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpeakerBio(String value, int index) {
    final _$actionInfo = _$_CreateActivityControllerBaseActionController
        .startAction(name: '_CreateActivityControllerBase.setSpeakerBio');
    try {
      return super.setSpeakerBio(value, index);
    } finally {
      _$_CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpeakerCompany(String value, int index) {
    final _$actionInfo = _$_CreateActivityControllerBaseActionController
        .startAction(name: '_CreateActivityControllerBase.setSpeakerCompany');
    try {
      return super.setSpeakerCompany(value, index);
    } finally {
      _$_CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSchedule() {
    final _$actionInfo = _$_CreateActivityControllerBaseActionController
        .startAction(name: '_CreateActivityControllerBase.addSchedule');
    try {
      return super.addSchedule();
    } finally {
      _$_CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSchedule(int index) {
    final _$actionInfo = _$_CreateActivityControllerBaseActionController
        .startAction(name: '_CreateActivityControllerBase.removeSchedule');
    try {
      return super.removeSchedule(index);
    } finally {
      _$_CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSpeaker() {
    final _$actionInfo = _$_CreateActivityControllerBaseActionController
        .startAction(name: '_CreateActivityControllerBase.addSpeaker');
    try {
      return super.addSpeaker();
    } finally {
      _$_CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSpeaker(int index) {
    final _$actionInfo = _$_CreateActivityControllerBaseActionController
        .startAction(name: '_CreateActivityControllerBase.removeSpeaker');
    try {
      return super.removeSpeaker(index);
    } finally {
      _$_CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activityToCreate: ${activityToCreate},
isLoading: ${isLoading}
    ''';
  }
}
