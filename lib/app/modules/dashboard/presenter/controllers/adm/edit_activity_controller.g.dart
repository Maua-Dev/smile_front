// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_activity_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditActivityController on EditActivityControllerBase, Store {
  late final _$activityToEditAtom =
      Atom(name: 'EditActivityControllerBase.activityToEdit', context: context);

  @override
  AdminActivityModel get activityToEdit {
    _$activityToEditAtom.reportRead();
    return super.activityToEdit;
  }

  @override
  set activityToEdit(AdminActivityModel value) {
    _$activityToEditAtom.reportWrite(value, super.activityToEdit, () {
      super.activityToEdit = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'EditActivityControllerBase.isLoading', context: context);

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

  late final _$allResponsibleProfessorsListAtom = Atom(
      name: 'EditActivityControllerBase.allResponsibleProfessorsList',
      context: context);

  @override
  List<ResponsibleProfessorModel>? get allResponsibleProfessorsList {
    _$allResponsibleProfessorsListAtom.reportRead();
    return super.allResponsibleProfessorsList;
  }

  @override
  set allResponsibleProfessorsList(List<ResponsibleProfessorModel>? value) {
    _$allResponsibleProfessorsListAtom
        .reportWrite(value, super.allResponsibleProfessorsList, () {
      super.allResponsibleProfessorsList = value;
    });
  }

  late final _$getAllResponsibleProfessorsAsyncAction = AsyncAction(
      'EditActivityControllerBase.getAllResponsibleProfessors',
      context: context);

  @override
  Future<dynamic> getAllResponsibleProfessors() {
    return _$getAllResponsibleProfessorsAsyncAction
        .run(() => super.getAllResponsibleProfessors());
  }

  late final _$setIsLoadingAsyncAction =
      AsyncAction('EditActivityControllerBase.setIsLoading', context: context);

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  late final _$editUserActivityAsyncAction = AsyncAction(
      'EditActivityControllerBase.editUserActivity',
      context: context);

  @override
  Future<dynamic> editUserActivity() {
    return _$editUserActivityAsyncAction.run(() => super.editUserActivity());
  }

  late final _$EditActivityControllerBaseActionController =
      ActionController(name: 'EditActivityControllerBase', context: context);

  @override
  String? validateRequiredField(String? value) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.validateRequiredField');
    try {
      return super.validateRequiredField(value);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateParticipantsField(String? value) {
    final _$actionInfo =
        _$EditActivityControllerBaseActionController.startAction(
            name: 'EditActivityControllerBase.validateParticipantsField');
    try {
      return super.validateParticipantsField(value);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateDurationField(String? value) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.validateDurationField');
    try {
      return super.validateDurationField(value);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeProfessor(int index) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.removeProfessor');
    try {
      return super.removeProfessor(index);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsExtensive() {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.setIsExtensive');
    try {
      return super.setIsExtensive();
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setType(ActivityEnum? value) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.setType');
    try {
      return super.setType(value);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setModality(DeliveryEnum? value) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.setModality');
    try {
      return super.setModality(value);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setActivityCode(String value) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.setActivityCode');
    try {
      return super.setActivityCode(value);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String value) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLocation(String value) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.setLocation');
    try {
      return super.setLocation(value);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLink(String value) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.setLink');
    try {
      return super.setLink(value);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setResponsibleProfessorId(String id, int index) {
    final _$actionInfo =
        _$EditActivityControllerBaseActionController.startAction(
            name: 'EditActivityControllerBase.setResponsibleProfessorId');
    try {
      return super.setResponsibleProfessorId(id, index);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addResponsibleProfessor() {
    final _$actionInfo =
        _$EditActivityControllerBaseActionController.startAction(
            name: 'EditActivityControllerBase.addResponsibleProfessor');
    try {
      return super.addResponsibleProfessor();
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(String value) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.setDate');
    try {
      return super.setDate(value);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHour(String value) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.setHour');
    try {
      return super.setHour(value);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setClosureDate(String value) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.setClosureDate');
    try {
      return super.setClosureDate(value);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setClosureHour(String value) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.setClosureHour');
    try {
      return super.setClosureHour(value);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDuration(String value) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.setDuration');
    try {
      return super.setDuration(value);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setParticipants(String value) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.setParticipants');
    try {
      return super.setParticipants(value);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpeakerName(String value, int index) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.setSpeakerName');
    try {
      return super.setSpeakerName(value, index);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpeakerBio(String value, int index) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.setSpeakerBio');
    try {
      return super.setSpeakerBio(value, index);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpeakerCompany(String value, int index) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.setSpeakerCompany');
    try {
      return super.setSpeakerCompany(value, index);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEnableSubscription(bool value) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.setEnableSubscription');
    try {
      return super.setEnableSubscription(value);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSpeaker() {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.addSpeaker');
    try {
      return super.addSpeaker();
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSpeaker(int index) {
    final _$actionInfo = _$EditActivityControllerBaseActionController
        .startAction(name: 'EditActivityControllerBase.removeSpeaker');
    try {
      return super.removeSpeaker(index);
    } finally {
      _$EditActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activityToEdit: ${activityToEdit},
isLoading: ${isLoading},
allResponsibleProfessorsList: ${allResponsibleProfessorsList}
    ''';
  }
}
