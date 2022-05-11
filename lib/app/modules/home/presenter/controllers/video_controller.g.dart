// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VideoController on VideoControllerBase, Store {
  late final _$isPlayingAtom =
      Atom(name: 'VideoControllerBase.isPlaying', context: context);

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  late final _$valAtom =
      Atom(name: 'VideoControllerBase.val', context: context);

  @override
  double get val {
    _$valAtom.reportRead();
    return super.val;
  }

  @override
  set val(double value) {
    _$valAtom.reportWrite(value, super.val, () {
      super.val = value;
    });
  }

  late final _$VideoControllerBaseActionController =
      ActionController(name: 'VideoControllerBase', context: context);

  @override
  void setIsPlaying() {
    final _$actionInfo = _$VideoControllerBaseActionController.startAction(
        name: 'VideoControllerBase.setIsPlaying');
    try {
      return super.setIsPlaying();
    } finally {
      _$VideoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVal(double value) {
    final _$actionInfo = _$VideoControllerBaseActionController.startAction(
        name: 'VideoControllerBase.setVal');
    try {
      return super.setVal(value);
    } finally {
      _$VideoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPlaying: ${isPlaying},
val: ${val}
    ''';
  }
}
