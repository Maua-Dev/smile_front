// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ActivityHomeController on _ActivityHomeControllerBase, Store {
  final _$listRectorsAtom =
      Atom(name: '_ActivityHomeControllerBase.listRectors');

  @override
  List<Rectors> get listRectors {
    _$listRectorsAtom.reportRead();
    return super.listRectors;
  }

  @override
  set listRectors(List<Rectors> value) {
    _$listRectorsAtom.reportWrite(value, super.listRectors, () {
      super.listRectors = value;
    });
  }

  final _$getRectorsAsyncAction =
      AsyncAction('_ActivityHomeControllerBase.getRectors');

  @override
  Future<dynamic> getRectors() {
    return _$getRectorsAsyncAction.run(() => super.getRectors());
  }

  @override
  String toString() {
    return '''
listRectors: ${listRectors}
    ''';
  }
}
