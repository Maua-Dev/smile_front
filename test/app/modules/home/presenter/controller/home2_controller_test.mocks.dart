// Mocks generated by Mockito 5.1.0 from annotations
// in smile_front/test/app/modules/home/presenter/controller/home2_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/home/domain/repositories/home2_repository_interface.dart'
    as _i2;
import 'package:smile_front/app/modules/home/infra/models/home_speaker_model.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [SpeakersRepositoryInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockSpeakersRepositoryInterface extends _i1.Mock
    implements _i2.SpeakersRepositoryInterface {
  MockSpeakersRepositoryInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.HomeSpeakerModel>> getSpeakers() => (super.noSuchMethod(
      Invocation.method(#getSpeakers, []),
      returnValue: Future<List<_i4.HomeSpeakerModel>>.value(
          <_i4.HomeSpeakerModel>[])) as _i3.Future<List<_i4.HomeSpeakerModel>>);
}
