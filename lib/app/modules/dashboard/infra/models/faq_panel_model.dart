import 'package:smile_front/app/modules/dashboard/domain/entities/faq.dart';

class FaqPanelModel {
  bool _isOpen = false;
  final Faq faq;

  FaqPanelModel({required this.faq});

  void changeStateIsOpen() {
    _isOpen = !_isOpen;
  }

  bool get isOpen => _isOpen;
}
