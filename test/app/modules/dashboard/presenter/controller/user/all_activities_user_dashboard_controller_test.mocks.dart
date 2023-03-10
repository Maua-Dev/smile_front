// Mocks generated by Mockito 5.3.2 from annotations
// in smile_front/test/app/modules/dashboard/presenter/controller/user/all_activities_user_dashboard_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;

import 'package:fl_country_code_picker/fl_country_code_picker.dart' as _i14;
import 'package:mobx/mobx.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart'
    as _i4;
import 'package:smile_front/app/modules/auth/domain/usecases/login_with_email.dart'
    as _i16;
import 'package:smile_front/app/modules/auth/domain/usecases/refresh_token.dart'
    as _i15;
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart'
    as _i13;
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart'
    as _i8;
import 'package:smile_front/app/modules/dashboard/domain/usecases/change_data.dart'
    as _i3;
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_user_subscribed_activities.dart'
    as _i18;
import 'package:smile_front/app/modules/dashboard/domain/usecases/subscribe_activities.dart'
    as _i19;
import 'package:smile_front/app/modules/dashboard/domain/usecases/unsubscribe_activities.dart'
    as _i17;
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart'
    as _i12;
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_subscription_controller.dart'
    as _i2;
import 'package:smile_front/app/shared/models/activity_model.dart' as _i10;
import 'package:smile_front/app/shared/models/admin_activity_model.dart'
    as _i11;
import 'package:smile_front/app/shared/models/enrolls_activity_model.dart'
    as _i5;
import 'package:smile_front/app/shared/models/user_model.dart' as _i7;

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

class _FakeEnrollsActivityModel_3 extends _i1.SmartFake
    implements _i5.EnrollsActivityModel {
  _FakeEnrollsActivityModel_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeReactiveContext_4 extends _i1.SmartFake
    implements _i6.ReactiveContext {
  _FakeReactiveContext_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserModel_5 extends _i1.SmartFake implements _i7.UserModel {
  _FakeUserModel_5(
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
    implements _i8.ActivitiesRepositoryInterface {
  MockActivitiesRepositoryInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<List<_i10.ActivityModel>> getAllActivities() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllActivities,
          [],
        ),
        returnValue:
            _i9.Future<List<_i10.ActivityModel>>.value(<_i10.ActivityModel>[]),
      ) as _i9.Future<List<_i10.ActivityModel>>);
  @override
  _i9.Future<List<_i5.EnrollsActivityModel>> getUserSubscribedActivities() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserSubscribedActivities,
          [],
        ),
        returnValue: _i9.Future<List<_i5.EnrollsActivityModel>>.value(
            <_i5.EnrollsActivityModel>[]),
      ) as _i9.Future<List<_i5.EnrollsActivityModel>>);
  @override
  _i9.Future<String> getDownloadLinkCsv() => (super.noSuchMethod(
        Invocation.method(
          #getDownloadLinkCsv,
          [],
        ),
        returnValue: _i9.Future<String>.value(''),
      ) as _i9.Future<String>);
  @override
  _i9.Future<dynamic> createActivity(_i10.ActivityModel? activityToCreate) =>
      (super.noSuchMethod(
        Invocation.method(
          #createActivity,
          [activityToCreate],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);
  @override
  _i9.Future<List<_i11.AdminActivityModel>> getAdminActivities() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAdminActivities,
          [],
        ),
        returnValue: _i9.Future<List<_i11.AdminActivityModel>>.value(
            <_i11.AdminActivityModel>[]),
      ) as _i9.Future<List<_i11.AdminActivityModel>>);
  @override
  _i9.Future<dynamic> editActivity(_i10.ActivityModel? activityToEdit) =>
      (super.noSuchMethod(
        Invocation.method(
          #editActivity,
          [activityToEdit],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);
  @override
  _i9.Future<dynamic> deleteActivity(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteActivity,
          [activityCode],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);
  @override
  _i9.Future<dynamic> manualDropActivity(
    String? activityCode,
    String? userId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #manualDropActivity,
          [
            activityCode,
            userId,
          ],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);
  @override
  _i9.Future<bool> subscribeActivity(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #subscribeActivity,
          [activityCode],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);
  @override
  _i9.Future<bool> unsubscribeActivity(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #unsubscribeActivity,
          [activityCode],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);
  @override
  _i9.Future<dynamic> confirmAttendance(
    String? confirmAttendanceCode,
    String? activityCode,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #confirmAttendance,
          [
            confirmAttendanceCode,
            activityCode,
          ],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);
}

/// A class which mocks [UserDashboardController].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserDashboardController extends _i1.Mock
    implements _i12.UserDashboardController {
  MockUserDashboardController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.UserEnrollmentController get enrollmentController => (super.noSuchMethod(
        Invocation.getter(#enrollmentController),
        returnValue: _FakeUserEnrollmentController_0(
          this,
          Invocation.getter(#enrollmentController),
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
  String get phoneToChange => (super.noSuchMethod(
        Invocation.getter(#phoneToChange),
        returnValue: '',
      ) as String);
  @override
  set phoneToChange(String? _phoneToChange) => super.noSuchMethod(
        Invocation.setter(
          #phoneToChange,
          _phoneToChange,
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
  List<_i5.EnrollsActivityModel> get subscribedActivitiesOnScreen =>
      (super.noSuchMethod(
        Invocation.getter(#subscribedActivitiesOnScreen),
        returnValue: <_i5.EnrollsActivityModel>[],
      ) as List<_i5.EnrollsActivityModel>);
  @override
  set subscribedActivitiesOnScreen(
          List<_i5.EnrollsActivityModel>? _subscribedActivitiesOnScreen) =>
      super.noSuchMethod(
        Invocation.setter(
          #subscribedActivitiesOnScreen,
          _subscribedActivitiesOnScreen,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set activityType(_i13.ActivityEnum? _activityType) => super.noSuchMethod(
        Invocation.setter(
          #activityType,
          _activityType,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set typeFilter(_i13.ActivityEnum? _typeFilter) => super.noSuchMethod(
        Invocation.setter(
          #typeFilter,
          _typeFilter,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set typeOnScreen(String? _typeOnScreen) => super.noSuchMethod(
        Invocation.setter(
          #typeOnScreen,
          _typeOnScreen,
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
  List<_i5.EnrollsActivityModel> get allSubscribedActivitiesList =>
      (super.noSuchMethod(
        Invocation.getter(#allSubscribedActivitiesList),
        returnValue: <_i5.EnrollsActivityModel>[],
      ) as List<_i5.EnrollsActivityModel>);
  @override
  set allSubscribedActivitiesList(
          List<_i5.EnrollsActivityModel>? _allSubscribedActivitiesList) =>
      super.noSuchMethod(
        Invocation.setter(
          #allSubscribedActivitiesList,
          _allSubscribedActivitiesList,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.EnrollsActivityModel get nextActivity => (super.noSuchMethod(
        Invocation.getter(#nextActivity),
        returnValue: _FakeEnrollsActivityModel_3(
          this,
          Invocation.getter(#nextActivity),
        ),
      ) as _i5.EnrollsActivityModel);
  @override
  set nextActivity(_i5.EnrollsActivityModel? _nextActivity) =>
      super.noSuchMethod(
        Invocation.setter(
          #nextActivity,
          _nextActivity,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set requisitionError(String? _requisitionError) => super.noSuchMethod(
        Invocation.setter(
          #requisitionError,
          _requisitionError,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set phone(String? _phone) => super.noSuchMethod(
        Invocation.setter(
          #phone,
          _phone,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get isBrazilianPhone => (super.noSuchMethod(
        Invocation.getter(#isBrazilianPhone),
        returnValue: false,
      ) as bool);
  @override
  set isBrazilianPhone(bool? _isBrazilianPhone) => super.noSuchMethod(
        Invocation.setter(
          #isBrazilianPhone,
          _isBrazilianPhone,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get isPhoneFieldFilled => (super.noSuchMethod(
        Invocation.getter(#isPhoneFieldFilled),
        returnValue: false,
      ) as bool);
  @override
  set isPhoneFieldFilled(bool? _isPhoneFieldFilled) => super.noSuchMethod(
        Invocation.setter(
          #isPhoneFieldFilled,
          _isPhoneFieldFilled,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set countryCode(_i14.CountryCode? _countryCode) => super.noSuchMethod(
        Invocation.setter(
          #countryCode,
          _countryCode,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_4(
          this,
          Invocation.getter(#context),
        ),
      ) as _i6.ReactiveContext);
  @override
  void setTypeFilter(_i13.ActivityEnum? value) => super.noSuchMethod(
        Invocation.method(
          #setTypeFilter,
          [value],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i9.Future<void> subscribeUserActivity(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #subscribeUserActivity,
          [activityCode],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> unsubscribeUserActivity(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #unsubscribeUserActivity,
          [activityCode],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
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
  List<_i5.EnrollsActivityModel> filterActivitiesByType(
    _i13.ActivityEnum? type,
    List<_i5.EnrollsActivityModel>? activitiesToFilter,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #filterActivitiesByType,
          [
            type,
            activitiesToFilter,
          ],
        ),
        returnValue: <_i5.EnrollsActivityModel>[],
      ) as List<_i5.EnrollsActivityModel>);
  @override
  List<_i5.EnrollsActivityModel> filterActivitiesByDate(
    DateTime? date,
    List<_i5.EnrollsActivityModel>? activitiesToFilter,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #filterActivitiesByDate,
          [
            date,
            activitiesToFilter,
          ],
        ),
        returnValue: <_i5.EnrollsActivityModel>[],
      ) as List<_i5.EnrollsActivityModel>);
  @override
  List<_i5.EnrollsActivityModel> filterActivitiesByHour(
    DateTime? hour,
    List<_i5.EnrollsActivityModel>? activitiesToFilter,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #filterActivitiesByHour,
          [
            hour,
            activitiesToFilter,
          ],
        ),
        returnValue: <_i5.EnrollsActivityModel>[],
      ) as List<_i5.EnrollsActivityModel>);
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
  _i9.Future<void> getCertificateWithSocialName() => (super.noSuchMethod(
        Invocation.method(
          #getCertificateWithSocialName,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> getUserName() => (super.noSuchMethod(
        Invocation.method(
          #getUserName,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> getPhone() => (super.noSuchMethod(
        Invocation.method(
          #getPhone,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> getUserSocialName() => (super.noSuchMethod(
        Invocation.method(
          #getUserSocialName,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> setWantSocialName(bool? value) => (super.noSuchMethod(
        Invocation.method(
          #setWantSocialName,
          [value],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
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
  _i9.Future<void> changeUserData() => (super.noSuchMethod(
        Invocation.method(
          #changeUserData,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
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
  _i9.Future<void> setIsLoading(bool? value) => (super.noSuchMethod(
        Invocation.method(
          #setIsLoading,
          [value],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<dynamic> getUserSubscribedActivities() => (super.noSuchMethod(
        Invocation.method(
          #getUserSubscribedActivities,
          [],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);
  @override
  void getNextActivity() => super.noSuchMethod(
        Invocation.method(
          #getNextActivity,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setBrazilianPhone(_i14.CountryCode? value) => super.noSuchMethod(
        Invocation.method(
          #setBrazilianPhone,
          [value],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setCountryCode(_i14.CountryCode? value) => super.noSuchMethod(
        Invocation.method(
          #setCountryCode,
          [value],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i9.Future<void> setPhone(String? value) => (super.noSuchMethod(
        Invocation.method(
          #setPhone,
          [value],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
}

/// A class which mocks [RefreshTokenInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockRefreshTokenInterface extends _i1.Mock
    implements _i15.RefreshTokenInterface {
  MockRefreshTokenInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<Map<String, dynamic>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue:
            _i9.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i9.Future<Map<String, dynamic>>);
}

/// A class which mocks [LoginWithEmailInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginWithEmailInterface extends _i1.Mock
    implements _i16.LoginWithEmailInterface {
  MockLoginWithEmailInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i7.UserModel> call(
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
        returnValue: _i9.Future<_i7.UserModel>.value(_FakeUserModel_5(
          this,
          Invocation.method(
            #call,
            [
              user,
              password,
            ],
          ),
        )),
      ) as _i9.Future<_i7.UserModel>);
}

/// A class which mocks [SecureStorageInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockSecureStorageInterface extends _i1.Mock
    implements _i4.SecureStorageInterface {
  MockSecureStorageInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<void> saveAccessToken(String? token) => (super.noSuchMethod(
        Invocation.method(
          #saveAccessToken,
          [token],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> saveRefreshToken(String? token) => (super.noSuchMethod(
        Invocation.method(
          #saveRefreshToken,
          [token],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<String?> getAccessToken() => (super.noSuchMethod(
        Invocation.method(
          #getAccessToken,
          [],
        ),
        returnValue: _i9.Future<String?>.value(),
      ) as _i9.Future<String?>);
  @override
  _i9.Future<String?> getRefreshToken() => (super.noSuchMethod(
        Invocation.method(
          #getRefreshToken,
          [],
        ),
        returnValue: _i9.Future<String?>.value(),
      ) as _i9.Future<String?>);
  @override
  _i9.Future<void> saveRole(String? role) => (super.noSuchMethod(
        Invocation.method(
          #saveRole,
          [role],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> saveId(String? id) => (super.noSuchMethod(
        Invocation.method(
          #saveId,
          [id],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> saveIdToken(String? idToken) => (super.noSuchMethod(
        Invocation.method(
          #saveIdToken,
          [idToken],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> saveName(String? name) => (super.noSuchMethod(
        Invocation.method(
          #saveName,
          [name],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> saveSocialName(String? socialName) => (super.noSuchMethod(
        Invocation.method(
          #saveSocialName,
          [socialName],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> savePhone(String? phone) => (super.noSuchMethod(
        Invocation.method(
          #savePhone,
          [phone],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> saveCertificateWithSocialName(
          bool? certificateWithSocialName) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveCertificateWithSocialName,
          [certificateWithSocialName],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<String?> getRole() => (super.noSuchMethod(
        Invocation.method(
          #getRole,
          [],
        ),
        returnValue: _i9.Future<String?>.value(),
      ) as _i9.Future<String?>);
  @override
  _i9.Future<String?> getId() => (super.noSuchMethod(
        Invocation.method(
          #getId,
          [],
        ),
        returnValue: _i9.Future<String?>.value(),
      ) as _i9.Future<String?>);
  @override
  _i9.Future<String?> getIdToken() => (super.noSuchMethod(
        Invocation.method(
          #getIdToken,
          [],
        ),
        returnValue: _i9.Future<String?>.value(),
      ) as _i9.Future<String?>);
  @override
  _i9.Future<String?> getName() => (super.noSuchMethod(
        Invocation.method(
          #getName,
          [],
        ),
        returnValue: _i9.Future<String?>.value(),
      ) as _i9.Future<String?>);
  @override
  _i9.Future<String?> getSocialName() => (super.noSuchMethod(
        Invocation.method(
          #getSocialName,
          [],
        ),
        returnValue: _i9.Future<String?>.value(),
      ) as _i9.Future<String?>);
  @override
  _i9.Future<String?> getPhone() => (super.noSuchMethod(
        Invocation.method(
          #getPhone,
          [],
        ),
        returnValue: _i9.Future<String?>.value(),
      ) as _i9.Future<String?>);
  @override
  _i9.Future<bool?> getCertificateWithSocialName() => (super.noSuchMethod(
        Invocation.method(
          #getCertificateWithSocialName,
          [],
        ),
        returnValue: _i9.Future<bool?>.value(),
      ) as _i9.Future<bool?>);
  @override
  _i9.Future<void> cleanSecureStorage() => (super.noSuchMethod(
        Invocation.method(
          #cleanSecureStorage,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
}

/// A class which mocks [UnsubscribeActivityInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockUnsubscribeActivityInterface extends _i1.Mock
    implements _i17.UnsubscribeActivityInterface {
  MockUnsubscribeActivityInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<bool> call(String? activityCode) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [activityCode],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);
}

/// A class which mocks [GetUserSubscribedActivitiesInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetUserSubscribedActivitiesInterface extends _i1.Mock
    implements _i18.GetUserSubscribedActivitiesInterface {
  MockGetUserSubscribedActivitiesInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<List<_i5.EnrollsActivityModel>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i9.Future<List<_i5.EnrollsActivityModel>>.value(
            <_i5.EnrollsActivityModel>[]),
      ) as _i9.Future<List<_i5.EnrollsActivityModel>>);
}

/// A class which mocks [SubscribeActivityInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockSubscribeActivityInterface extends _i1.Mock
    implements _i19.SubscribeActivityInterface {
  MockSubscribeActivityInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<bool> call(String? activityCode) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [activityCode],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);
}
