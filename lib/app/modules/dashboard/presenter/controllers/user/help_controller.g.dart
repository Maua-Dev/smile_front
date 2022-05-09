// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HelpController on _HelpControllerBase, Store {
  late final _$faqAtom =
      Atom(name: '_HelpControllerBase.faq', context: context);

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

  late final _$faqActionAtom =
      Atom(name: '_HelpControllerBase.faqAction', context: context);

  @override
  List<FaqPanelModel> get faqAction {
    _$faqActionAtom.reportRead();
    return super.faqAction;
  }

  @override
  set faqAction(List<FaqPanelModel> value) {
    _$faqActionAtom.reportWrite(value, super.faqAction, () {
      super.faqAction = value;
    });
  }

  late final _$getFaqInformationAsyncAction =
      AsyncAction('_HelpControllerBase.getFaqInformation', context: context);

  @override
  Future<void> getFaqInformation() {
    return _$getFaqInformationAsyncAction.run(() => super.getFaqInformation());
  }

  late final _$_HelpControllerBaseActionController =
      ActionController(name: '_HelpControllerBase', context: context);

  @override
  void setFaqAction() {
    final _$actionInfo = _$_HelpControllerBaseActionController.startAction(
        name: '_HelpControllerBase.setFaqAction');
    try {
      return super.setFaqAction();
    } finally {
      _$_HelpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void swapOpen(int index) {
    final _$actionInfo = _$_HelpControllerBaseActionController.startAction(
        name: '_HelpControllerBase.swapOpen');
    try {
      return super.swapOpen(index);
    } finally {
      _$_HelpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
faq: ${faq},
faqAction: ${faqAction}
    ''';
  }
}
