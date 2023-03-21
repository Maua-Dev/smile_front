import 'package:flutter/material.dart';
import 'package:smile_front/generated/l10n.dart';

import '../../../../../../shared/themes/app_colors.dart';
import 'text_field_dialog_widget.dart';

class SpeakerAddWidget extends StatelessWidget {
  final void Function(String value)? onChangedName;
  final void Function(String value)? onChangedBio;
  final void Function(String value)? onChangedCompany;
  final String? Function(String? value)? validateRequiredField;
  final void Function()? removeSpeaker;
  final String? name;
  final String? bio;
  final String? company;
  final int length;
  const SpeakerAddWidget(
      {Key? key,
      this.onChangedName,
      this.onChangedBio,
      this.onChangedCompany,
      this.removeSpeaker,
      this.name,
      this.bio,
      this.company,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: TextFieldDialogWidget(
                        validator: validateRequiredField,
                        labelText: S.of(context).speakerNameTitle,
                        padding: false,
                        onChanged: onChangedName,
                        value: name,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: TextFieldDialogWidget(
                        validator: validateRequiredField,
                        labelText: S.of(context).companyTitleWithoutDouble,
                        onChanged: onChangedCompany,
                        value: company,
                        padding: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldDialogWidget(
                  validator: validateRequiredField,
                  labelText: 'Bio',
                  value: bio,
                  onChanged: onChangedBio,
                  padding: false,
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
                  onPressed: removeSpeaker,
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
