// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_activity_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditActivityController on _EditActivityControllerBase, Store {
  final _$activityToEditAtom =
      Atom(name: '_EditActivityControllerBase.activityToEdit');

  @override
  ActivityModel get activityToEdit {
    _$activityToEditAtom.reportRead();
    return super.activityToEdit;
  }

  @override
  set activityToEdit(ActivityModel value) {
    _$activityToEditAtom.reportWrite(value, super.activityToEdit, () {
      super.activityToEdit = value;
    });
  }

  final _$editActivityAsyncAction =
      AsyncAction('_EditActivityControllerBase.editActivity');

  @override
  Future<dynamic> editActivity() {
    return _$editActivityAsyncAction.run(() => super.editActivity());
  }

  final _$deleteActivityAsyncAction =
      AsyncAction('_EditActivityControllerBase.deleteActivity');

  @override
  Future<dynamic> deleteActivity(String id) {
    return _$deleteActivityAsyncAction.run(() => super.deleteActivity(id));
  }

  final _$_EditActivityControllerBaseActionController =
      ActionController(name: '_EditActivityControllerBase');

  @override
  bool isFilled() {
    final _$actionInfo = _$_EditActivityControllerBaseActionController
        .startAction(name: '_EditActivityControllerBase.isFilled');
    try {
      return super.isFilled();
    } finally {
      _$_EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setType(ActivityEnum? value) {
    final _$actionInfo = _$_EditActivityControllerBaseActionController
        .startAction(name: '_EditActivityControllerBase.setType');
    try {
      return super.setType(value);
    } finally {
      _$_EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_EditActivityControllerBaseActionController
        .startAction(name: '_EditActivityControllerBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_EditActivityControllerBaseActionController
        .startAction(name: '_EditActivityControllerBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLocation(String value) {
    final _$actionInfo = _$_EditActivityControllerBaseActionController
        .startAction(name: '_EditActivityControllerBase.setLocation');
    try {
      return super.setLocation(value);
    } finally {
      _$_EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(String value, int index) {
    final _$actionInfo = _$_EditActivityControllerBaseActionController
        .startAction(name: '_EditActivityControllerBase.setDate');
    try {
      return super.setDate(value, index);
    } finally {
      _$_EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHour(String value, int index) {
    final _$actionInfo = _$_EditActivityControllerBaseActionController
        .startAction(name: '_EditActivityControllerBase.setHour');
    try {
      return super.setHour(value, index);
    } finally {
      _$_EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDuration(String value, int index) {
    final _$actionInfo = _$_EditActivityControllerBaseActionController
        .startAction(name: '_EditActivityControllerBase.setDuration');
    try {
      return super.setDuration(value, index);
    } finally {
      _$_EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setParticipants(int value, int index) {
    final _$actionInfo = _$_EditActivityControllerBaseActionController
        .startAction(name: '_EditActivityControllerBase.setParticipants');
    try {
      return super.setParticipants(value, index);
    } finally {
      _$_EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpeakerName(String value) {
    final _$actionInfo = _$_EditActivityControllerBaseActionController
        .startAction(name: '_EditActivityControllerBase.setSpeakerName');
    try {
      return super.setSpeakerName(value);
    } finally {
      _$_EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpeakerBio(String value) {
    final _$actionInfo = _$_EditActivityControllerBaseActionController
        .startAction(name: '_EditActivityControllerBase.setSpeakerBio');
    try {
      return super.setSpeakerBio(value);
    } finally {
      _$_EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpeakerCompany(String value) {
    final _$actionInfo = _$_EditActivityControllerBaseActionController
        .startAction(name: '_EditActivityControllerBase.setSpeakerCompany');
    try {
      return super.setSpeakerCompany(value);
    } finally {
      _$_EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSchedule() {
    final _$actionInfo = _$_EditActivityControllerBaseActionController
        .startAction(name: '_EditActivityControllerBase.addSchedule');
    try {
      return super.addSchedule();
    } finally {
      _$_EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSchedule(int index) {
    final _$actionInfo = _$_EditActivityControllerBaseActionController
        .startAction(name: '_EditActivityControllerBase.removeSchedule');
    try {
      return super.removeSchedule(index);
    } finally {
      _$_EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activityToEdit: ${activityToEdit}
    ''';
  }
}
