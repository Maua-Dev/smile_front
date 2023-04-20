// Mocks generated by Mockito 5.4.0 from annotations
// in smile_front/test/app/modules/dashboard/presenter/controller/adm/create_Activity_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/dashboard/domain/usecases/create_activity.dart'
    as _i2;
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_responsible_professors.dart'
    as _i5;
import 'package:smile_front/app/shared/models/admin_activity_model.dart' as _i4;
import 'package:smile_front/app/shared/models/responsible_professor_model.dart'
    as _i6;

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

/// A class which mocks [CreateActivityInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockCreateActivityInterface extends _i1.Mock
    implements _i2.CreateActivityInterface {
  MockCreateActivityInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<dynamic> call(_i4.AdminActivityModel? activityToCreate) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [activityToCreate],
        ),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);
}

/// A class which mocks [GetResponsibleProfessorsInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetResponsibleProfessorsInterface extends _i1.Mock
    implements _i5.GetResponsibleProfessorsInterface {
  MockGetResponsibleProfessorsInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i6.ResponsibleProfessorModel>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i3.Future<List<_i6.ResponsibleProfessorModel>>.value(
            <_i6.ResponsibleProfessorModel>[]),
      ) as _i3.Future<List<_i6.ResponsibleProfessorModel>>);
}
