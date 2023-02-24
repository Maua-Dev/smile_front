// Mocks generated by Mockito 5.3.2 from annotations
// in smile_front/test/app/modules/dashboard/presenter/controller/user/all_activities_user_dashboard_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;

import 'package:mobx/mobx.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart'
    as _i4;
import 'package:smile_front/app/modules/auth/domain/usecases/login_with_email.dart'
    as _i17;
import 'package:smile_front/app/modules/auth/domain/usecases/refresh_token.dart'
    as _i16;
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart'
    as _i14;
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart'
    as _i9;
import 'package:smile_front/app/modules/dashboard/domain/usecases/change_data.dart'
    as _i3;
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_all_activities.dart'
    as _i15;
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart'
    as _i13;
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_subscription_controller.dart'
    as _i2;
import 'package:smile_front/app/shared/models/activity_model.dart' as _i11;
import 'package:smile_front/app/shared/models/admin_activity_model.dart'
    as _i12;
import 'package:smile_front/app/shared/models/enrolls_activity_model.dart'
    as _i6;
import 'package:smile_front/app/shared/models/user_model.dart' as _i8;
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart'
    as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUserEnrollmentController_0 extends _i1.SmartFake
    implements _i2.UserEnrollmentController {
  _FakeUserEnrollmentController_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeChangeDataInterface_1 extends _i1.SmartFake
    implements _i3.ChangeDataInterface {
  _FakeChangeDataInterface_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSecureStorageInterface_2 extends _i1.SmartFake
    implements _i4.SecureStorageInterface {
  _FakeSecureStorageInterface_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFirebaseAnalyticsService_3 extends _i1.SmartFake
    implements _i5.FirebaseAnalyticsService {
  _FakeFirebaseAnalyticsService_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEnrollsActivityModel_4 extends _i1.SmartFake
    implements _i6.EnrollsActivityModel {
  _FakeEnrollsActivityModel_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeReactiveContext_5 extends _i1.SmartFake
    implements _i7.ReactiveContext {
  _FakeReactiveContext_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserModel_6 extends _i1.SmartFake implements _i8.UserModel {
  _FakeUserModel_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ActivitiesRepositoryInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockActivitiesRepositoryInterface extends _i1.Mock
    implements _i9.ActivitiesRepositoryInterface {
  MockActivitiesRepositoryInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i10.Future<List<_i11.ActivityModel>> getAllActivities() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllActivities,
          [],
        ),
        returnValue:
            _i10.Future<List<_i11.ActivityModel>>.value(<_i11.ActivityModel>[]),
      ) as _i10.Future<List<_i11.ActivityModel>>);
  @override
  _i10.Future<List<_i6.EnrollsActivityModel>> getUserSubscribedActivities() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserSubscribedActivities,
          [],
        ),
        returnValue: _i10.Future<List<_i6.EnrollsActivityModel>>.value(
            <_i6.EnrollsActivityModel>[]),
      ) as _i10.Future<List<_i6.EnrollsActivityModel>>);
  @override
  _i10.Future<String> getDownloadLinkCsv() => (super.noSuchMethod(
        Invocation.method(
          #getDownloadLinkCsv,
          [],
        ),
        returnValue: _i10.Future<String>.value(''),
      ) as _i10.Future<String>);
  @override
  _i10.Future<dynamic> createActivity(_i11.ActivityModel? activityToCreate) =>
      (super.noSuchMethod(
        Invocation.method(
          #createActivity,
          [activityToCreate],
        ),
        returnValue: _i10.Future<dynamic>.value(),
      ) as _i10.Future<dynamic>);
  @override
  _i10.Future<List<_i12.AdminActivityModel>> getAdminActivities() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAdminActivities,
          [],
        ),
        returnValue: _i10.Future<List<_i12.AdminActivityModel>>.value(
            <_i12.AdminActivityModel>[]),
      ) as _i10.Future<List<_i12.AdminActivityModel>>);
  @override
  _i10.Future<dynamic> editActivity(_i11.ActivityModel? activityToEdit) =>
      (super.noSuchMethod(
        Invocation.method(
          #editActivity,
          [activityToEdit],
        ),
        returnValue: _i10.Future<dynamic>.value(),
      ) as _i10.Future<dynamic>);
  @override
  _i10.Future<dynamic> deleteActivity(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteActivity,
          [activityCode],
        ),
        returnValue: _i10.Future<dynamic>.value(),
      ) as _i10.Future<dynamic>);
  @override
  _i10.Future<bool> subscribeActivity(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #subscribeActivity,
          [activityCode],
        ),
        returnValue: _i10.Future<bool>.value(false),
      ) as _i10.Future<bool>);
  @override
  _i10.Future<bool> unsubscribeActivity(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #unsubscribeActivity,
          [activityCode],
        ),
        returnValue: _i10.Future<bool>.value(false),
      ) as _i10.Future<bool>);
}

/// A class which mocks [UserDashboardController].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserDashboardController extends _i1.Mock
    implements _i13.UserDashboardController {
  MockUserDashboardController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.UserEnrollmentController get subscriptionController =>
      (super.noSuchMethod(
        Invocation.getter(#subscriptionController),
        returnValue: _FakeUserEnrollmentController_0(
          this,
          Invocation.getter(#subscriptionController),
        ),
      ) as _i2.UserEnrollmentController);
  @override
  _i3.ChangeDataInterface get changeData => (super.noSuchMethod(
        Invocation.getter(#changeData),
        returnValue: _FakeChangeDataInterface_1(
          this,
          Invocation.getter(#changeData),
        ),
      ) as _i3.ChangeDataInterface);
  @override
  _i4.SecureStorageInterface get secureStorage => (super.noSuchMethod(
        Invocation.getter(#secureStorage),
        returnValue: _FakeSecureStorageInterface_2(
          this,
          Invocation.getter(#secureStorage),
        ),
      ) as _i4.SecureStorageInterface);
  @override
  _i5.FirebaseAnalyticsService get analytics => (super.noSuchMethod(
        Invocation.getter(#analytics),
        returnValue: _FakeFirebaseAnalyticsService_3(
          this,
          Invocation.getter(#analytics),
        ),
      ) as _i5.FirebaseAnalyticsService);
  @override
  set error(String? _error) => super.noSuchMethod(
        Invocation.setter(
          #error,
          _error,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set socialName(String? _socialName) => super.noSuchMethod(
        Invocation.setter(
          #socialName,
          _socialName,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set name(String? _name) => super.noSuchMethod(
        Invocation.setter(
          #name,
          _name,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get certificateWithSocialName => (super.noSuchMethod(
        Invocation.getter(#certificateWithSocialName),
        returnValue: false,
      ) as bool);
  @override
  set certificateWithSocialName(bool? _certificateWithSocialName) =>
      super.noSuchMethod(
        Invocation.setter(
          #certificateWithSocialName,
          _certificateWithSocialName,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get socialNameToChange => (super.noSuchMethod(
        Invocation.getter(#socialNameToChange),
        returnValue: '',
      ) as String);
  @override
  set socialNameToChange(String? _socialNameToChange) => super.noSuchMethod(
        Invocation.setter(
          #socialNameToChange,
          _socialNameToChange,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get nameToChange => (super.noSuchMethod(
        Invocation.getter(#nameToChange),
        returnValue: '',
      ) as String);
  @override
  set nameToChange(String? _nameToChange) => super.noSuchMethod(
        Invocation.setter(
          #nameToChange,
          _nameToChange,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get wantSocialName => (super.noSuchMethod(
        Invocation.getter(#wantSocialName),
        returnValue: false,
      ) as bool);
  @override
  set wantSocialName(bool? _wantSocialName) => super.noSuchMethod(
        Invocation.setter(
          #wantSocialName,
          _wantSocialName,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<_i6.EnrollsActivityModel> get subscribedActivitiesOnScreen =>
      (super.noSuchMethod(
        Invocation.getter(#subscribedActivitiesOnScreen),
        returnValue: <_i6.EnrollsActivityModel>[],
      ) as List<_i6.EnrollsActivityModel>);
  @override
  set subscribedActivitiesOnScreen(
          List<_i6.EnrollsActivityModel>? _subscribedActivitiesOnScreen) =>
      super.noSuchMethod(
        Invocation.setter(
          #subscribedActivitiesOnScreen,
          _subscribedActivitiesOnScreen,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set activityType(_i14.ActivityEnum? _activityType) => super.noSuchMethod(
        Invocation.setter(
          #activityType,
          _activityType,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set typeFilter(_i14.ActivityEnum? _typeFilter) => super.noSuchMethod(
        Invocation.setter(
          #typeFilter,
          _typeFilter,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set dateFilter(DateTime? _dateFilter) => super.noSuchMethod(
        Invocation.setter(
          #dateFilter,
          _dateFilter,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set hourFilter(DateTime? _hourFilter) => super.noSuchMethod(
        Invocation.setter(
          #hourFilter,
          _hourFilter,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get isLoading => (super.noSuchMethod(
        Invocation.getter(#isLoading),
        returnValue: false,
      ) as bool);
  @override
  set isLoading(bool? _isLoading) => super.noSuchMethod(
        Invocation.setter(
          #isLoading,
          _isLoading,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get filterActivityChipIndexSelected => (super.noSuchMethod(
        Invocation.getter(#filterActivityChipIndexSelected),
        returnValue: 0,
      ) as int);
  @override
  set filterActivityChipIndexSelected(int? _filterActivityChipIndexSelected) =>
      super.noSuchMethod(
        Invocation.setter(
          #filterActivityChipIndexSelected,
          _filterActivityChipIndexSelected,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<_i6.EnrollsActivityModel> get allSubscribedActivitiesList =>
      (super.noSuchMethod(
        Invocation.getter(#allSubscribedActivitiesList),
        returnValue: <_i6.EnrollsActivityModel>[],
      ) as List<_i6.EnrollsActivityModel>);
  @override
  set allSubscribedActivitiesList(
          List<_i6.EnrollsActivityModel>? _allSubscribedActivitiesList) =>
      super.noSuchMethod(
        Invocation.setter(
          #allSubscribedActivitiesList,
          _allSubscribedActivitiesList,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.EnrollsActivityModel get nextActivity => (super.noSuchMethod(
        Invocation.getter(#nextActivity),
        returnValue: _FakeEnrollsActivityModel_4(
          this,
          Invocation.getter(#nextActivity),
        ),
      ) as _i6.EnrollsActivityModel);
  @override
  set nextActivity(_i6.EnrollsActivityModel? _nextActivity) =>
      super.noSuchMethod(
        Invocation.setter(
          #nextActivity,
          _nextActivity,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_5(
          this,
          Invocation.getter(#context),
        ),
      ) as _i7.ReactiveContext);
  @override
  void setTypeFilter(_i14.ActivityEnum? value) => super.noSuchMethod(
        Invocation.method(
          #setTypeFilter,
          [value],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setDateFilter(DateTime? value) => super.noSuchMethod(
        Invocation.method(
          #setDateFilter,
          [value],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setHourFilter(DateTime? value) => super.noSuchMethod(
        Invocation.method(
          #setHourFilter,
          [value],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setAllFilters() => super.noSuchMethod(
        Invocation.method(
          #setAllFilters,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<_i6.EnrollsActivityModel> filterActivitiesByType(
    _i14.ActivityEnum? type,
    List<_i6.EnrollsActivityModel>? activitiesToFilter,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #filterActivitiesByType,
          [
            type,
            activitiesToFilter,
          ],
        ),
        returnValue: <_i6.EnrollsActivityModel>[],
      ) as List<_i6.EnrollsActivityModel>);
  @override
  List<_i6.EnrollsActivityModel> filterActivitiesByDate(
    DateTime? date,
    List<_i6.EnrollsActivityModel>? activitiesToFilter,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #filterActivitiesByDate,
          [
            date,
            activitiesToFilter,
          ],
        ),
        returnValue: <_i6.EnrollsActivityModel>[],
      ) as List<_i6.EnrollsActivityModel>);
  @override
  List<_i6.EnrollsActivityModel> filterActivitiesByHour(
    DateTime? hour,
    List<_i6.EnrollsActivityModel>? activitiesToFilter,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #filterActivitiesByHour,
          [
            hour,
            activitiesToFilter,
          ],
        ),
        returnValue: <_i6.EnrollsActivityModel>[],
      ) as List<_i6.EnrollsActivityModel>);
  @override
  bool isValidDateFilter(
    DateTime? activityDate,
    DateTime? dateToFilter,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #isValidDateFilter,
          [
            activityDate,
            dateToFilter,
          ],
        ),
        returnValue: false,
      ) as bool);
  @override
  bool isValidHourFilter(
    DateTime? activityDate,
    DateTime? dateToFilter,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #isValidHourFilter,
          [
            activityDate,
            dateToFilter,
          ],
        ),
        returnValue: false,
      ) as bool);
  @override
  _i10.Future<void> getCertificateWithSocialName() => (super.noSuchMethod(
        Invocation.method(
          #getCertificateWithSocialName,
          [],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);
  @override
  _i10.Future<void> getUserName() => (super.noSuchMethod(
        Invocation.method(
          #getUserName,
          [],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);
  @override
  _i10.Future<void> getUserSocialName() => (super.noSuchMethod(
        Invocation.method(
          #getUserSocialName,
          [],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);
  @override
  _i10.Future<void> setWantSocialName(bool? value) => (super.noSuchMethod(
        Invocation.method(
          #setWantSocialName,
          [value],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);
  @override
  void setName(String? value) => super.noSuchMethod(
        Invocation.method(
          #setName,
          [value],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setUserSocialName(String? value) => super.noSuchMethod(
        Invocation.method(
          #setUserSocialName,
          [value],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setCertificateWithSocialName(bool? value) => super.noSuchMethod(
        Invocation.method(
          #setCertificateWithSocialName,
          [value],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i10.Future<void> changeUserData() => (super.noSuchMethod(
        Invocation.method(
          #changeUserData,
          [],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);
  @override
  bool validateName() => (super.noSuchMethod(
        Invocation.method(
          #validateName,
          [],
        ),
        returnValue: false,
      ) as bool);
  @override
  bool validateSocialName() => (super.noSuchMethod(
        Invocation.method(
          #validateSocialName,
          [],
        ),
        returnValue: false,
      ) as bool);
  @override
  _i10.Future<void> setIsLoading(bool? value) => (super.noSuchMethod(
        Invocation.method(
          #setIsLoading,
          [value],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);
  @override
  _i10.Future<dynamic> getUserSubscribedActivities() => (super.noSuchMethod(
        Invocation.method(
          #getUserSubscribedActivities,
          [],
        ),
        returnValue: _i10.Future<dynamic>.value(),
      ) as _i10.Future<dynamic>);
  @override
  void getNextActivity() => super.noSuchMethod(
        Invocation.method(
          #getNextActivity,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [GetAllUserActivitiesInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAllUserActivitiesInterface extends _i1.Mock
    implements _i15.GetAllUserActivitiesInterface {
  MockGetAllUserActivitiesInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i10.Future<List<_i11.ActivityModel>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue:
            _i10.Future<List<_i11.ActivityModel>>.value(<_i11.ActivityModel>[]),
      ) as _i10.Future<List<_i11.ActivityModel>>);
}

/// A class which mocks [RefreshTokenInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockRefreshTokenInterface extends _i1.Mock
    implements _i16.RefreshTokenInterface {
  MockRefreshTokenInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i10.Future<Map<String, dynamic>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue:
            _i10.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i10.Future<Map<String, dynamic>>);
}

/// A class which mocks [LoginWithEmailInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginWithEmailInterface extends _i1.Mock
    implements _i17.LoginWithEmailInterface {
  MockLoginWithEmailInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i10.Future<_i8.UserModel> call(
    String? user,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [
            user,
            password,
          ],
        ),
        returnValue: _i10.Future<_i8.UserModel>.value(_FakeUserModel_6(
          this,
          Invocation.method(
            #call,
            [
              user,
              password,
            ],
          ),
        )),
      ) as _i10.Future<_i8.UserModel>);
}
