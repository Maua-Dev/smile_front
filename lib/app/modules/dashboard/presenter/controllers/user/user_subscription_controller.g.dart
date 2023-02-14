// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_subscription_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserSubscriptionController on UserSubscriptionControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'UserSubscriptionControllerBase.isLoading', context: context);

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

  late final _$userEnrolledActivitiesAtom = Atom(
      name: 'UserSubscriptionControllerBase.userEnrolledActivities',
      context: context);

  @override
  List<EnrollsActivityModel> get userEnrolledActivities {
    _$userEnrolledActivitiesAtom.reportRead();
    return super.userEnrolledActivities;
  }

  @override
  set userEnrolledActivities(List<EnrollsActivityModel> value) {
    _$userEnrolledActivitiesAtom
        .reportWrite(value, super.userEnrolledActivities, () {
      super.userEnrolledActivities = value;
    });
  }

  late final _$getUserEnrolledActivitiesAsyncAction = AsyncAction(
      'UserSubscriptionControllerBase.getUserEnrolledActivities',
      context: context);

  @override
  Future<dynamic> getUserEnrolledActivities() {
    return _$getUserEnrolledActivitiesAsyncAction
        .run(() => super.getUserEnrolledActivities());
  }

  late final _$UserSubscriptionControllerBaseActionController =
      ActionController(
          name: 'UserSubscriptionControllerBase', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$UserSubscriptionControllerBaseActionController
        .startAction(name: 'UserSubscriptionControllerBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$UserSubscriptionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
userEnrolledActivities: ${userEnrolledActivities}
    ''';
  }
}
