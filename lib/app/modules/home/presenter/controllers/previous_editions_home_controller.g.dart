// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'previous_editions_home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PreviousEditionsHomeController
    on _PreviousEditionsHomeControllerBase, Store {
  final _$listLectureImagesAtom =
      Atom(name: '_PreviousEditionsHomeControllerBase.listLectureImages');

  @override
  List<LectureImages> get listLectureImages {
    _$listLectureImagesAtom.reportRead();
    return super.listLectureImages;
  }

  @override
  set listLectureImages(List<LectureImages> value) {
    _$listLectureImagesAtom.reportWrite(value, super.listLectureImages, () {
      super.listLectureImages = value;
    });
  }

  final _$getLectureImagesAsyncAction =
      AsyncAction('_PreviousEditionsHomeControllerBase.getLectureImages');

  @override
  Future<dynamic> getLectureImages() {
    return _$getLectureImagesAsyncAction.run(() => super.getLectureImages());
  }

  @override
  String toString() {
    return '''
listLectureImages: ${listLectureImages}
    ''';
  }
}
