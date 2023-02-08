import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../../../shared/entities/infra/delivery_enum.dart';
import '../../../../../../shared/entities/screen_variables.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../shared/utils/screen_helper.dart';
import '../../../../../../shared/widgets/text-fields/drop_down_field_custom.dart';
import 'text_field_dialog_widget.dart';

class ScheduleWidget extends StatelessWidget {
  final void Function(String value)? onChangedParticipants;
  final void Function(String)? onChangedDate;
  final void Function(String)? onChangedHour;
  final void Function(String)? onChangedClosure;
  final void Function(DeliveryEnum?)? onChangedModality;
  final void Function(String value)? onChangedDuration;
  final void Function(String value)? onChangedLocation;
  final void Function(String value)? onChangedLink;
  final void Function(String value)? onChangedProfessor;
  final void Function(bool? value)? onChangedEnableSubscription;
  final void Function()? onPressedIconDate;
  final void Function()? onPressedIconTime;
  final void Function()? removeSchedule;
  final String? Function(String? value)? isValidDate;
  final String? Function(String? value)? validateRequiredField;
  final DeliveryEnum? modality;
  final bool? enableSubscription;
  final int? totalParticipants;
  final String date;
  final String? hour;
  final int? duration;
  final String? link;
  final String? location;
  final int length;
  final String? closeInscriptions;
  final String? professorName;

  const ScheduleWidget({
    Key? key,
    this.isValidDate,
    this.onChangedParticipants,
    this.onChangedDate,
    this.onChangedHour,
    this.totalParticipants,
    this.hour,
    this.removeSchedule,
    this.duration,
    required this.length,
    this.onChangedDuration,
    this.onChangedLocation,
    this.onChangedLink,
    this.link,
    this.location,
    required this.date,
    this.onPressedIconDate,
    this.onPressedIconTime,
    this.enableSubscription,
    this.onChangedEnableSubscription,
    this.closeInscriptions,
    this.professorName,
    this.onChangedProfessor,
    this.onChangedClosure,
    this.onChangedModality,
    this.modality,
    this.validateRequiredField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: TextFieldDialogWidget(
                        validator: validateRequiredField,
                        labelText: S.of(context).dateTitle,
                        hintText: 'DD/MM/AAAA',
                        onChanged: onChangedDate,
                        value: date,
                        padding: false,
                        inputFormatters: [
                          MaskTextInputFormatter(
                            mask: '##/##/####',
                          )
                        ]),
                  ),
                  Flexible(
                    child: TextFieldDialogWidget(
                        validator: validateRequiredField,
                        labelText: S.of(context).scheduleTitle,
                        hintText: 'HH:MM',
                        onChanged: onChangedHour,
                        value: hour ?? '',
                        padding: false,
                        inputFormatters: [
                          MaskTextInputFormatter(
                            mask: '##:##',
                          )
                        ]),
                  ),
                  Flexible(
                    child: TextFieldDialogWidget(
                        validator: validateRequiredField,
                        labelText: S.of(context).activityDurationTitle,
                        onChanged: onChangedDuration,
                        value: duration == null ? '' : duration.toString(),
                        padding: false,
                        inputFormatters: [
                          MaskTextInputFormatter(
                            mask: '###',
                          )
                        ]),
                  ),
                  Flexible(
                    child: TextFieldDialogWidget(
                      validator: validateRequiredField,
                      labelText: S.of(context).activityVacancyNumber,
                      onChanged: onChangedParticipants,
                      value: totalParticipants == null
                          ? ''
                          : totalParticipants.toString(),
                      padding: false,
                    ),
                  ),
                  Flexible(
                      child: Column(
                    children: [
                      Text(
                        S.of(context).activityAcceptSbscriptions,
                        style: AppTextStyles.titleH1.copyWith(
                            color: AppColors.brandingBlue,
                            fontSize: MediaQuery.of(context).size.width < 1200
                                ? 17
                                : 20),
                      ),
                      Checkbox(
                        value: enableSubscription,
                        onChanged: onChangedEnableSubscription,
                        fillColor:
                            MaterialStateProperty.all(AppColors.brandingBlue),
                        mouseCursor: SystemMouseCursors.click,
                      ),
                    ],
                  ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFieldDialogWidget(
                        labelText: 'Link',
                        value: link,
                        onChanged: onChangedLink,
                        padding: false,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: TextFieldDialogWidget(
                        labelText: 'Local',
                        value: location,
                        onChanged: onChangedLocation,
                        padding: false,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFieldDialogWidget(
                        validator: validateRequiredField,
                        labelText: S.of(context).activityResponsibleTeacher,
                        value: professorName,
                        onChanged: onChangedProfessor,
                        padding: false,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: TextFieldDialogWidget(
                          validator: isValidDate,
                          labelText: S.of(context).activityInscriptionClosure,
                          hintText: 'DD/MM/AAAA',
                          onChanged: onChangedClosure,
                          value: closeInscriptions ?? '',
                          padding: false,
                          inputFormatters: [
                            MaskTextInputFormatter(
                              mask: '##/##/####',
                            )
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: SizedBox(
                        width: Screen.width(context) * 0.25,
                        child: DropDownFieldCustom<DeliveryEnum>(
                          textStyles: AppTextStyles.body.copyWith(
                              color: AppColors.brandingBlue,
                              fontSize:
                                  Screen.width(context) < tabletSize ? 16 : 20),
                          filledColor: Colors.white,
                          titulo: S.of(context).activityTypeTitle,
                          value: modality,
                          items: DeliveryEnum.values
                              .toList()
                              .map((DeliveryEnum value) {
                            return DropdownMenuItem<DeliveryEnum>(
                              value: value,
                              child: Text(value.name),
                            );
                          }).toList(),
                          onChanged: onChangedModality,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        length > 1
            ? const SizedBox(
                width: 16,
              )
            : const SizedBox.shrink(),
        length > 1
            ? IconButton(
                padding: EdgeInsets.zero,
                hoverColor: Colors.red.shade100,
                onPressed: removeSchedule,
                icon: Icon(
                  Icons.close,
                  size: 32,
                  color: AppColors.redButton,
                ))
            : const SizedBox.shrink(),
      ],
    );
  }
}
