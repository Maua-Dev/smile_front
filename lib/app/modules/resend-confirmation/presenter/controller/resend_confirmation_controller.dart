import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

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
  String cpf = '';

  @observable
  bool successRegistration = false;

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
    try {
      await resendConfirmationRepository.resendConfirmation(cpf);
      emailSent = true;
    } on Failure catch (e) {
      showErrorSnackBar(errorMessage: e.message, color: AppColors.redButton);
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
      showErrorSnackBar(
          errorMessage: 'Campo "CPF" obrigatório', color: AppColors.redButton);

      return false;
    } else if (!CPFValidator.isValid(value)) {
      showErrorSnackBar(
          errorMessage: 'Campo "CPF" inválido', color: AppColors.redButton);
      return false;
    }
    return true;
  }

  @action
  bool validateForm() {
    return validateCpf(cpf);
  }
}
