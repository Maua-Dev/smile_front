// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HelpController on HelpControllerBase, Store {
  late final _$faqAtom = Atom(name: 'HelpControllerBase.faq', context: context);

  @override
  List<Faq> get faq {
    _$faqAtom.reportRead();
    return super.faq;
  }

  @override
  set faq(List<Faq> value) {
    _$faqAtom.reportWrite(value, super.faq, () {
      super.faq = value;
    });
  }

  late final _$getFaqInformationAsyncAction =
      AsyncAction('HelpControllerBase.getFaqInformation', context: context);

  @override
  ObservableFuture<void> getFaqInformation() {
    return ObservableFuture<void>(
        _$getFaqInformationAsyncAction.run(() => super.getFaqInformation()));
  }

  @override
  String toString() {
    return '''
faq: ${faq}
    ''';
  }
}
