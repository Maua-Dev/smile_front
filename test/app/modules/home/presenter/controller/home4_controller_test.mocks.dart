// Mocks generated by Mockito 5.1.0 from annotations
// in smile_front/test/app/modules/home/presenter/controller/home4_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/home/domain/entities/lecture_images.dart'
    as _i4;
import 'package:smile_front/app/modules/home/domain/repositories/lecture_images_repository.dart'
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

/// A class which mocks [LectureImagesRepositoryInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockLectureImagesRepositoryInterface extends _i1.Mock
    implements _i2.LectureImagesRepositoryInterface {
  MockLectureImagesRepositoryInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.LectureImages>> getLectureImages() =>
      (super.noSuchMethod(Invocation.method(#getLectureImages, []),
              returnValue:
                  Future<List<_i4.LectureImages>>.value(<_i4.LectureImages>[]))
          as _i3.Future<List<_i4.LectureImages>>);
}
