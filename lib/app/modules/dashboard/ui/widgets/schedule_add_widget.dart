import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:smile_front/app/modules/dashboard/ui/widgets/text_field_dialog_widget.dart';

import '../../../../shared/themes/app_colors.dart';

class ScheduleAddWidget extends StatelessWidget {
  final void Function(String value)? onChangedParticipants;
  final void Function(String value)? onChangedDate;
  final void Function(String value)? onChangedHour;
  final void Function(String value)? onChangedDuration;
  final void Function(String value)? onChangedLocation;
  final void Function(String value)? onChangedLink;
  final void Function()? removeSchedule;
  final int? totalParticipants;
  final String? date;
  final String? hour;
  final String? duration;
  final String? link;
  final String? location;
  final int index;

  const ScheduleAddWidget({
    Key? key,
    this.onChangedParticipants,
    this.onChangedDate,
    this.onChangedHour,
    this.totalParticipants,
    this.date,
    this.hour,
    this.removeSchedule,
    this.duration,
    required this.index,
    this.onChangedDuration,
    this.onChangedLocation,
    this.onChangedLink,
    this.link,
    this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: TextFieldDialogWidget(
                  labelText: 'Data',
                  hintText: 'DD-MM-AAAA',
                  onChanged: onChangedDate,
                  value: date ?? '',
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
            index != 0
                ? const SizedBox(
                    width: 16,
                  )
                : const SizedBox.shrink(),
            index != 0
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
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              Flexible(
                child: TextFieldDialogWidget(
                  labelText: 'Local',
                  value: location,
                  onChanged: onChangedLocation,
                  padding: false,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Flexible(
                child: TextFieldDialogWidget(
                  labelText: 'Link',
                  value: link,
                  onChanged: onChangedLink,
                  padding: false,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
