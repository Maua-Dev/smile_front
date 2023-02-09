// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'more_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MoreInfoController on MoreInfoControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'MoreInfoControllerBase.isLoading', context: context);

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

  late final _$MoreInfoControllerBaseActionController =
      ActionController(name: 'MoreInfoControllerBase', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$MoreInfoControllerBaseActionController.startAction(
        name: 'MoreInfoControllerBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$MoreInfoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
