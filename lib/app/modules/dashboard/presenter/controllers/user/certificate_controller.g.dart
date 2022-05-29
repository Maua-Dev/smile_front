// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CertificateController on _CertificateControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_CertificateControllerBase.isLoading', context: context);

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

  late final _$certificateListAtom = Atom(
      name: '_CertificateControllerBase.certificateList', context: context);

  @override
  List<CertificateModel> get certificateList {
    _$certificateListAtom.reportRead();
    return super.certificateList;
  }

  @override
  set certificateList(List<CertificateModel> value) {
    _$certificateListAtom.reportWrite(value, super.certificateList, () {
      super.certificateList = value;
    });
  }

  late final _$setIsLoadingAsyncAction =
      AsyncAction('_CertificateControllerBase.setIsLoading', context: context);

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  late final _$getUserCertificatesAsyncAction = AsyncAction(
      '_CertificateControllerBase.getUserCertificates',
      context: context);

  @override
  Future<void> getUserCertificates() {
    return _$getUserCertificatesAsyncAction
        .run(() => super.getUserCertificates());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
certificateList: ${certificateList}
    ''';
  }
}
