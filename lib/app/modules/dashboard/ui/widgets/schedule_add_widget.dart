import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:smile_front/app/modules/dashboard/ui/widgets/text_field_dialog_widget.dart';

import '../../../../shared/themes/app_colors.dart';

class ScheduleAddWidget extends StatelessWidget {
  final void Function(String value)? onChangedParticipants;
  final void Function(String)? onChangedDate;
  final void Function(String)? onChangedHour;
  final void Function(String value)? onChangedDuration;
  final void Function(String value)? onChangedLocation;
  final void Function(String value)? onChangedLink;
  final void Function()? onPressedIconDate;
  final void Function()? onPressedIconTime;
  final void Function()? removeSchedule;
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
                  const SizedBox(
                    width: 16,
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
                  const SizedBox(
                    width: 16,
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
                  const SizedBox(
                    width: 16,
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
