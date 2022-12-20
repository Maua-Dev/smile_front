// Mocks generated by Mockito 5.3.2 from annotations
// in smile_front/test/app/modules/dashboard/presenter/controller/user/help_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/dashboard/domain/entities/faq.dart'
    as _i4;
import 'package:smile_front/app/modules/dashboard/domain/repositories/faq_repository_interface.dart'
    as _i2;

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

/// A class which mocks [FaqRepositoryInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockFaqRepositoryInterface extends _i1.Mock
    implements _i2.FaqRepositoryInterface {
  MockFaqRepositoryInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Faq>> getAllFaq() => (super.noSuchMethod(
        Invocation.method(
          #getAllFaq,
          [],
        ),
        returnValue: _i3.Future<List<_i4.Faq>>.value(<_i4.Faq>[]),
      ) as _i3.Future<List<_i4.Faq>>);
}
