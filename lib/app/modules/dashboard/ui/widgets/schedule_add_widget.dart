import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:smile_front/app/modules/dashboard/ui/widgets/text_field_dialog_widget.dart';

import '../../../../shared/themes/app_colors.dart';

class ScheduleAddWidget extends StatelessWidget {
  final void Function(String value)? onChangedParticipants;
  final void Function(String value)? onChangedDate;
  final void Function(String value)? onChangedHour;
  final void Function()? removeSchedule;
  final int? totalParticipants;
  final String? date;
  final String? hour;

  const ScheduleAddWidget(
      {Key? key,
      this.onChangedParticipants,
      this.onChangedDate,
      this.onChangedHour,
      this.totalParticipants,
      this.date,
      this.hour,
      this.removeSchedule})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextFieldDialogWidget(
              hintText: 'Data (DD-MM-AAAA)',
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
              hintText: 'Hora (hh:mm)',
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
            hintText: 'Número de Vagas',
            onChanged: onChangedParticipants,
            value:
                totalParticipants == null ? '' : totalParticipants.toString(),
            padding: false,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        IconButton(
            padding: EdgeInsets.zero,
            hoverColor: Colors.red.shade100,
            onPressed: removeSchedule,
            icon: Icon(
              Icons.close,
              size: 32,
              color: AppColors.redButton,
            ))
      ],
    );
  }
}
