import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/repository/forgot_password_datasource_interface.dart';
import '../../external/errors.dart';

part 'forgot_password_controller.g.dart';

class ForgotPasswordController = _ForgotPasswordController
    with _$ForgotPasswordController;

abstract class _ForgotPasswordController with Store {
  final ForgotPasswordRepositoryInterface forgotPasswordRepository;

  _ForgotPasswordController({required this.forgotPasswordRepository});

  @observable
  bool isLoading = false;

  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  String verifyPassword = '';

  @observable
  String errors = '';

  @action
  Future<void> setError(String value) async {
    errors = value;
  }

  @action
  Future<void> setUsername(String value) async {
    username = value;
    if (!value.contains('@')) {
      username = username.replaceAll('.', '').replaceAll('-', '');
    }
  }

  @action
  String? validateUsername(String value) {
    if (value.isEmpty) {
      return "         Campo obrigatório";
    }
    //fazer a velidação do cpf
    return null;
  }

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @action
  Future<void> forgotPassword() async {
    setIsLoading(true);
    try {
      await forgotPasswordRepository.forgotPassword(username);
      Modular.to.navigate('/escolher-senha');
    } on Failure catch (e) {
      errors = e.message;
    }
    setIsLoading(false);
  }
}
