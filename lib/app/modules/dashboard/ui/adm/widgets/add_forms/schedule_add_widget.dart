import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_web.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import 'text_field_dialog_widget.dart';

class ScheduleAddWidget extends StatelessWidget {
  final void Function(String value)? onChangedParticipants;
  final void Function(String)? onChangedDate;
  final void Function(String)? onChangedHour;
  final void Function(String value)? onChangedDuration;
  final void Function(String value)? onChangedLocation;
  final void Function(String value)? onChangedLink;
  final void Function(bool? value)? onChangedEnableSubscription;
  final void Function()? onPressedIconDate;
  final void Function()? onPressedIconTime;
  final void Function()? removeSchedule;
  final bool? enableSubscription;
  final int? totalParticipants;
  final String date;
  final String? hour;
  final String? duration;
  final String? link;
  final String? location;
  final int length;

  const ScheduleAddWidget({
    Key? key,
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
                        onPressedIcon: onPressedIconDate,
                        suffixIcon: Icons.timer,
                        labelText: 'Data',
                        hintText: 'DD-MM-AAAA',
                        onChanged: onChangedDate,
                        value: date,
                        padding: false,
                        inputFormatters: [
                          MaskTextInputFormatter(
                            mask: '##-##-####',
                          )
                        ]),
                  ),
                  Flexible(
                    child: TextFieldDialogWidget(
                        onPressedIcon: onPressedIconTime,
                        suffixIcon: Icons.timer,
                        labelText: 'Hora',
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
                        labelText: 'Duração',
                        hintText: 'HH:MM',
                        onChanged: onChangedDuration,
                        value: duration ?? '',
                        padding: false,
                        inputFormatters: [
                          MaskTextInputFormatter(
                            mask: '##:##',
                          )
                        ]),
                  ),
                  Flexible(
                    child: TextFieldDialogWidget(
                      labelText: 'Número de Vagas',
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
                      TextRenderer(
                        child: Text(
                          'Aceitar inscrições',
                          style: AppTextStyles.titleH1.copyWith(
                              color: AppColors.brandingPurple,
                              fontSize: MediaQuery.of(context).size.width < 1200
                                  ? 17
                                  : 20),
                        ),
                      ),
                      Checkbox(
                        value: enableSubscription,
                        onChanged: onChangedEnableSubscription,
                        fillColor:
                            MaterialStateProperty.all(AppColors.brandingPurple),
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
