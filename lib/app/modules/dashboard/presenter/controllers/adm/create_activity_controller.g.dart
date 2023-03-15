// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_activity_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateActivityController on CreateActivityControllerBase, Store {
  late final _$activityToCreateAtom = Atom(
      name: 'CreateActivityControllerBase.activityToCreate', context: context);

  @override
  AdminActivityModel get activityToCreate {
    _$activityToCreateAtom.reportRead();
    return super.activityToCreate;
  }

  @override
  set activityToCreate(AdminActivityModel value) {
    _$activityToCreateAtom.reportWrite(value, super.activityToCreate, () {
      super.activityToCreate = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'CreateActivityControllerBase.isLoading', context: context);

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
      name: 'CreateActivityControllerBase.allResponsibleProfessorsList',
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

  late final _$responsibleProfessorAtom = Atom(
      name: 'CreateActivityControllerBase.responsibleProfessor',
      context: context);

  @override
  ResponsibleProfessorModel get responsibleProfessor {
    _$responsibleProfessorAtom.reportRead();
    return super.responsibleProfessor;
  }

  @override
  set responsibleProfessor(ResponsibleProfessorModel value) {
    _$responsibleProfessorAtom.reportWrite(value, super.responsibleProfessor,
        () {
      super.responsibleProfessor = value;
    });
  }

  late final _$getAllResponsibleProfessorsAsyncAction = AsyncAction(
      'CreateActivityControllerBase.getAllResponsibleProfessors',
      context: context);

  @override
  Future<dynamic> getAllResponsibleProfessors() {
    return _$getAllResponsibleProfessorsAsyncAction
        .run(() => super.getAllResponsibleProfessors());
  }

  late final _$setIsLoadingAsyncAction = AsyncAction(
      'CreateActivityControllerBase.setIsLoading',
      context: context);

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  late final _$createUserActivityAsyncAction = AsyncAction(
      'CreateActivityControllerBase.createUserActivity',
      context: context);

  @override
  Future<dynamic> createUserActivity() {
    return _$createUserActivityAsyncAction
        .run(() => super.createUserActivity());
  }

  late final _$CreateActivityControllerBaseActionController =
      ActionController(name: 'CreateActivityControllerBase', context: context);

  @override
  String? validateRequiredField(String? value) {
    final _$actionInfo =
        _$CreateActivityControllerBaseActionController.startAction(
            name: 'CreateActivityControllerBase.validateRequiredField');
    try {
      return super.validateRequiredField(value);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? isValidSubscriptionclosureDate(String? value) {
    final _$actionInfo =
        _$CreateActivityControllerBaseActionController.startAction(
            name:
                'CreateActivityControllerBase.isValidSubscriptionclosureDate');
    try {
      return super.isValidSubscriptionclosureDate(value);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setModality(DeliveryEnum? value) {
    final _$actionInfo = _$CreateActivityControllerBaseActionController
        .startAction(name: 'CreateActivityControllerBase.setModality');
    try {
      return super.setModality(value);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsExtensive() {
    final _$actionInfo = _$CreateActivityControllerBaseActionController
        .startAction(name: 'CreateActivityControllerBase.setIsExtensive');
    try {
      return super.setIsExtensive();
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setType(ActivityEnum? value) {
    final _$actionInfo = _$CreateActivityControllerBaseActionController
        .startAction(name: 'CreateActivityControllerBase.setType');
    try {
      return super.setType(value);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setActivityCode(String value) {
    final _$actionInfo = _$CreateActivityControllerBaseActionController
        .startAction(name: 'CreateActivityControllerBase.setActivityCode');
    try {
      return super.setActivityCode(value);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String value) {
    final _$actionInfo = _$CreateActivityControllerBaseActionController
        .startAction(name: 'CreateActivityControllerBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setResponsibleProfessorId(String id) {
    final _$actionInfo =
        _$CreateActivityControllerBaseActionController.startAction(
            name: 'CreateActivityControllerBase.setResponsibleProfessorId');
    try {
      return super.setResponsibleProfessorId(id);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$CreateActivityControllerBaseActionController
        .startAction(name: 'CreateActivityControllerBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLocation(String value) {
    final _$actionInfo = _$CreateActivityControllerBaseActionController
        .startAction(name: 'CreateActivityControllerBase.setLocation');
    try {
      return super.setLocation(value);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLink(String value) {
    final _$actionInfo = _$CreateActivityControllerBaseActionController
        .startAction(name: 'CreateActivityControllerBase.setLink');
    try {
      return super.setLink(value);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(String value) {
    final _$actionInfo = _$CreateActivityControllerBaseActionController
        .startAction(name: 'CreateActivityControllerBase.setDate');
    try {
      return super.setDate(value);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHour(String value) {
    final _$actionInfo = _$CreateActivityControllerBaseActionController
        .startAction(name: 'CreateActivityControllerBase.setHour');
    try {
      return super.setHour(value);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDuration(String value) {
    final _$actionInfo = _$CreateActivityControllerBaseActionController
        .startAction(name: 'CreateActivityControllerBase.setDuration');
    try {
      return super.setDuration(value);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setClosureDate(String value) {
    final _$actionInfo = _$CreateActivityControllerBaseActionController
        .startAction(name: 'CreateActivityControllerBase.setClosureDate');
    try {
      return super.setClosureDate(value);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setClosureHour(String value) {
    final _$actionInfo = _$CreateActivityControllerBaseActionController
        .startAction(name: 'CreateActivityControllerBase.setClosureHour');
    try {
      return super.setClosureHour(value);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setParticipants(String value) {
    final _$actionInfo = _$CreateActivityControllerBaseActionController
        .startAction(name: 'CreateActivityControllerBase.setParticipants');
    try {
      return super.setParticipants(value);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEnableSubscription(bool value) {
    final _$actionInfo =
        _$CreateActivityControllerBaseActionController.startAction(
            name: 'CreateActivityControllerBase.setEnableSubscription');
    try {
      return super.setEnableSubscription(value);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpeakerName(String value, int index) {
    final _$actionInfo = _$CreateActivityControllerBaseActionController
        .startAction(name: 'CreateActivityControllerBase.setSpeakerName');
    try {
      return super.setSpeakerName(value, index);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpeakerBio(String value, int index) {
    final _$actionInfo = _$CreateActivityControllerBaseActionController
        .startAction(name: 'CreateActivityControllerBase.setSpeakerBio');
    try {
      return super.setSpeakerBio(value, index);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpeakerCompany(String value, int index) {
    final _$actionInfo = _$CreateActivityControllerBaseActionController
        .startAction(name: 'CreateActivityControllerBase.setSpeakerCompany');
    try {
      return super.setSpeakerCompany(value, index);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSpeaker() {
    final _$actionInfo = _$CreateActivityControllerBaseActionController
        .startAction(name: 'CreateActivityControllerBase.addSpeaker');
    try {
      return super.addSpeaker();
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSpeaker(int index) {
    final _$actionInfo = _$CreateActivityControllerBaseActionController
        .startAction(name: 'CreateActivityControllerBase.removeSpeaker');
    try {
      return super.removeSpeaker(index);
    } finally {
      _$CreateActivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activityToCreate: ${activityToCreate},
isLoading: ${isLoading},
allResponsibleProfessorsList: ${allResponsibleProfessorsList},
responsibleProfessor: ${responsibleProfessor}
    ''';
  }
}
