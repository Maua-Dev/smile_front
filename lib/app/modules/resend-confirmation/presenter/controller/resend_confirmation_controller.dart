import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

import '../../../../app_widget.dart';
import '../../../../shared/error/error_snackbar.dart';
import '../../domain/repository/resend_confirmation_datasource_interface.dart';
import '../../external/errors.dart';

part 'resend_confirmation_controller.g.dart';

class ResendConfirmationController = _ResendConfirmationController
    with _$ResendConfirmationController;

abstract class _ResendConfirmationController with Store {
  final ResendConfirmationRepositoryInterface resendConfirmationRepository;

  _ResendConfirmationController({required this.resendConfirmationRepository});

  @observable
  bool isLoading = false;

  @observable
  bool emailSent = false;

  @observable
  String errors = '';

  @observable
  String cpf = '';

  @observable
  bool successRegistration = false;

  @action
  Future<void> setError(String value) async {
    errors = value;
  }

  @action
  Future<void> setCpf(String value) async {
    cpf = value.replaceAll('.', '').replaceAll('-', '');
  }

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @action
  Future<void> resendConfirmation() async {
    setIsLoading(true);
    errors = '';
    try {
      await resendConfirmationRepository.resendConfirmation(cpf);
      emailSent = true;
    } on Failure catch (e) {
      if (scaffold.context.size!.width <= 1024) {
        showErrorSnackBar(errorMessage: e.message, color: AppColors.redButton);
      } else {
        errors = e.message;
      }
    }
    setIsLoading(false);
  }

  @action
  Future<void> setSuccessRegistration(bool value) async {
    successRegistration = value;
  }

  @action
  bool validateCpf(String value) {
    value = value.replaceAll('.', '');
    value = value.replaceAll('-', '');
    if (value.isEmpty) {
      if (scaffold.context.size!.width <= 1024) {
        showErrorSnackBar(
            errorMessage: 'Campo "CPF" obrigatório',
            color: AppColors.redButton);
      } else {
        errors = 'Campo "CPF" obrigatório';
      }
      return false;
    } else if (!CPFValidator.isValid(value)) {
      if (scaffold.context.size!.width <= 1024) {
        showErrorSnackBar(
            errorMessage: 'Campo "CPF" inválido', color: AppColors.redButton);
      } else {
        errors = 'Campo "CPF" inválido';
      }
      return false;
    }
    return true;
  }

  @action
  bool validateForm() {
    return validateCpf(cpf);
  }
}
