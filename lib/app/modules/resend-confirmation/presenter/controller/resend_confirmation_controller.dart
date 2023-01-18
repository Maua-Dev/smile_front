import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

import '../../../../../generated/l10n.dart';
import '../../../../app_widget.dart';
import '../../../../shared/error/error_snackbar.dart';
import '../../external/errors.dart';
import '../../usecases/resend_confirmation.dart';

part 'resend_confirmation_controller.g.dart';

class ResendConfirmationController = ResendConfirmationControllerBase
    with _$ResendConfirmationController;

abstract class ResendConfirmationControllerBase with Store {
  final ResendConfirmationInterface resendUserConfirmation;

  ResendConfirmationControllerBase({required this.resendUserConfirmation});

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
      await resendUserConfirmation(cpf);
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
  String? validateCpf(String? value) {
    if (value!.isEmpty) {
      return S.current.fieldRequired;
    } else if (!CPFValidator.isValid(value)) {
      value = value.replaceAll('.', '');
      value = value.replaceAll('-', '');
      return S.current.fieldCpfInvalid;
    }
    return null;
  }
}
