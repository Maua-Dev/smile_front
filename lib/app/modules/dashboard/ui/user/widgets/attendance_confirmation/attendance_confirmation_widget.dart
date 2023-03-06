import 'package:flutter/material.dart';

import '../../../../../../../generated/l10n.dart';
import '../../../../../../shared/entities/infra/enrollment_state_enum.dart';
import '../../../../../../shared/entities/screen_variables.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';

class AttendanceConfirmationWidget extends StatelessWidget {
  final bool isLoading;
  final EnrollmentStateEnum? enrollmentState;
  final void Function(String code) onConfirmCode;
  final bool checkCanViewConfirmAttendance;
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final FocusNode _lastNode = FocusNode();

  AttendanceConfirmationWidget(
      {Key? key,
      required this.isLoading,
      required this.onConfirmCode,
      required this.checkCanViewConfirmAttendance,
      this.enrollmentState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (checkCanViewConfirmAttendance) {
      return Container(
        width: MediaQuery.of(context).size.width > tabletSize
            ? MediaQuery.of(context).size.width * 0.36
            : MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.brandingOrange),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(S.of(context).presenceValidateTitle,
                  style: AppTextStyles.bold.copyWith(
                      fontSize: MediaQuery.of(context).size.width < tabletSize
                          ? 20
                          : 24,
                      color: AppColors.brandingOrange)),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Insira o código para realizar a validação de presença',
                  style: AppTextStyles.bold.copyWith(
                    fontSize: MediaQuery.of(context).size.width < tabletSize
                        ? 14
                        : 16,
                    color: AppColors.gray,
                  ),
                ),
              ),
            ),
            isLoading
                ? Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Center(
                        child: CircularProgressIndicator(
                      color: AppColors.brandingBlue,
                    )),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _controllers.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width < tabletSize
                              ? 28
                              : 40,
                          child: TextField(
                            controller: _controllers[index],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            textInputAction: index == _controllers.length - 1
                                ? TextInputAction.done
                                : TextInputAction.next,
                            focusNode: index == _controllers.length - 1
                                ? _lastNode
                                : null,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                if (value.length >= 2) {
                                  _controllers[index].text = value[0];
                                }
                                if (index < _controllers.length - 1) {
                                  _controllers[index + 1].text = value[1];
                                  FocusScope.of(context).nextFocus();
                                }
                                if (index == _controllers.length - 1) {
                                  _controllers[index].selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset:
                                              _controllers[index].text.length));
                                }
                              } else if (value.isEmpty && index > 0) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
            const SizedBox(height: 15),
            SizedBox(
              width: 150,
              height: 33,
              child: ElevatedButton(
                  onPressed: (() {
                    onConfirmCode(_controllers.map((e) => e.text).join());
                  }),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: AppColors.brandingOrange))),
                    backgroundColor: MaterialStateProperty.all(AppColors.white),
                  ),
                  child: Text('Confirmar',
                      style: AppTextStyles.bold.copyWith(
                          fontSize: 15, color: AppColors.brandingOrange))),
            ),
            const SizedBox(height: 40),
          ],
        ),
      );
    }
    if (enrollmentState == EnrollmentStateEnum.NONE) {
      return Container();
    }
    return Container(
      width: MediaQuery.of(context).size.width > tabletSize
          ? MediaQuery.of(context).size.width * 0.36
          : MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.brandingOrange),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(S.of(context).presenceValidateTitle,
                style: AppTextStyles.bold
                    .copyWith(fontSize: 24, color: AppColors.brandingOrange)),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width > tabletSize
                ? MediaQuery.of(context).size.width * 0.3
                : MediaQuery.of(context).size.width * 0.6,
            child: Text(
              'Aguarde o início da atividade e seu professor responsável gerar o código de validação.',
              style: AppTextStyles.bold.copyWith(
                fontSize: 15,
                color: AppColors.gray,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
