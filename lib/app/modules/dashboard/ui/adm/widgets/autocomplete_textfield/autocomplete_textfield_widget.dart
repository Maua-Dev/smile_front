import 'package:flutter/material.dart';

import '../../../../../../shared/models/responsible_professor_model.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';

class AutocompleteTextField extends StatelessWidget {
  final String labelText;
  final void Function(String value) onChangedProfessor;
  final List<ResponsibleProfessorModel>? responsibleProfessors;
  final ResponsibleProfessorModel? professor;
  const AutocompleteTextField(
      {super.key,
      required this.labelText,
      this.professor,
      this.responsibleProfessors,
      required this.onChangedProfessor});
  static String _displayStringForOption(ResponsibleProfessorModel option) =>
      option.name;
  @override
  Widget build(BuildContext context) {
    return Autocomplete<ResponsibleProfessorModel>(
      initialValue:
          professor != null ? TextEditingValue(text: professor!.name) : null,
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<ResponsibleProfessorModel>.empty();
        }
        if (responsibleProfessors != null) {
          return responsibleProfessors!
              .where((ResponsibleProfessorModel option) {
            return option.name
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase());
          });
        }
        return const Iterable<ResponsibleProfessorModel>.empty();
      },
      fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0, left: 4),
              child: Text(
                labelText,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  onEditingComplete: onEditingComplete,
                  style: AppTextStyles.body.copyWith(
                      color: AppColors.brandingBlue,
                      fontSize:
                          MediaQuery.of(context).size.width < 1200 ? 16 : 20),
                  decoration: InputDecoration(
                      isDense: true,
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.brandingOrange),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.brandingOrange),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorStyle: TextStyle(
                        color: AppColors.brandingOrange,
                        fontSize: 16,
                        height: 1,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: AppColors.brandingBlue, width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: AppColors.brandingBlue, width: 0.0),
                      ),
                      labelStyle: AppTextStyles.titleH1.copyWith(
                          color: AppColors.brandingBlue, fontSize: 22),
                      hintStyle: AppTextStyles.body.copyWith(
                          color: AppColors.brandingBlue, fontSize: 20),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
      onSelected: (ResponsibleProfessorModel selection) {
        onChangedProfessor(selection.id);
      },
    );
  }
}
