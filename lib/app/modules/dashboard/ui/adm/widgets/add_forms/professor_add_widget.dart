import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/autocomplete_textfield/autocomplete_textfield_widget.dart';
import 'package:smile_front/app/shared/infra/models/responsible_professor_model.dart';
import 'package:smile_front/generated/l10n.dart';

import '../../../../../../shared/themes/app_colors.dart';

class ProfessorAddWidget extends StatelessWidget {
  final String? Function(String? value)? validateRequiredField;
  final void Function()? removeProfessor;

  final void Function(String value)? onChangedProfessor;

  final int length;
  final ResponsibleProfessorModel? professor;
  final List<ResponsibleProfessorModel>? responsibleProfessors;
  const ProfessorAddWidget(
      {Key? key,
      this.responsibleProfessors,
      this.removeProfessor,
      this.onChangedProfessor,
      this.professor,
      required this.length,
      this.validateRequiredField})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 114, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
              child: AutocompleteTextField(
            professor: professor,
            onChangedProfessor: onChangedProfessor!,
            responsibleProfessors: responsibleProfessors!,
            labelText: S.of(context).activityResponsibleTeacher,
          )),
          length > 1
              ? IconButton(
                  padding: EdgeInsets.zero,
                  hoverColor: Colors.red.shade100,
                  onPressed: removeProfessor,
                  icon: Icon(
                    Icons.close,
                    size: 32,
                    color: AppColors.redButton,
                  ))
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
