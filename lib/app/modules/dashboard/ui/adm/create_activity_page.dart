import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/widgets/buttons/forms_button_widget.dart';
import '../../../../shared/widgets/dialogs/action_confirmation_dialog_widget.dart';
import '../../../../shared/widgets/dialogs/fill_all_fields_dialog_widget.dart';
import '../../../../shared/widgets/text-fields/drop_down_field_custom.dart';
import '../../../../shared/widgets/text_header_scratched.dart';
import '../../domain/infra/activity_enum.dart';
import '../../presenter/controllers/adm/create_activity_controller.dart';
import '../widgets/text_field_dialog_widget.dart';

class CreateActivityPage extends StatefulWidget {
  const CreateActivityPage({Key? key}) : super(key: key);

  @override
  State<CreateActivityPage> createState() => _CreateActivityPageState();
}

class _CreateActivityPageState
    extends ModularState<CreateActivityPage, CreateActivityController> {
  @override
  Widget build(BuildContext context) {
    var currentSelectedValue = '';
    var titleController = TextEditingController();
    var descriptionController = TextEditingController();
    var totalParticipantsController = TextEditingController();
    var dateController = TextEditingController();
    var hourController = TextEditingController();
    var locationController = TextEditingController();
    var speakerNameController = TextEditingController();
    var speakerCompanyController = TextEditingController();
    var speakerBioController = TextEditingController();
    bool isFilled() {
      if (titleController.text != '' &&
          descriptionController.text != '' &&
          currentSelectedValue != '' &&
          totalParticipantsController.text != '' &&
          dateController.text != '' &&
          hourController.text != '' &&
          locationController.text != '' &&
          speakerNameController.text != '' &&
          speakerCompanyController.text != '' &&
          speakerBioController.text != '') return true;
      return false;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: TextHeaderScratched(
                title: 'Editar Atividade',
                leftPadding: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 114, vertical: 8),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: DropDownFieldCustom<String>(
                      textStyles: AppTextStyles.body.copyWith(
                          color: AppColors.brandingBlue, fontSize: 20),
                      filledColor: Colors.white,
                      titulo: 'Tipo de Atividade',
                      value: currentSelectedValue,
                      items: ActivityEnum.values
                          .toList()
                          .map((ActivityEnum value) {
                        return DropdownMenuItem<String>(
                          value: value.name,
                          child: Text(value.name),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        currentSelectedValue = newValue!;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: TextFieldDialogWidget(
                        hintText: 'Titulo da Atividade',
                        padding: false,
                        controller: titleController),
                  ),
                ],
              ),
            ),
            TextFieldDialogWidget(
              hintText: 'Descrição',
              controller: descriptionController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 114, vertical: 8),
              child: Row(
                children: [
                  Flexible(
                    child: TextFieldDialogWidget(
                      hintText: 'Número de Vagas',
                      controller: totalParticipantsController,
                      padding: false,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: TextFieldDialogWidget(
                        hintText: 'Data (DD-MM-AAAA)',
                        controller: dateController,
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
                        controller: hourController,
                        padding: false,
                        inputFormatters: [
                          MaskTextInputFormatter(
                            mask: '##:##',
                          )
                        ]),
                  ),
                ],
              ),
            ),
            TextFieldDialogWidget(
                hintText: 'Local/Link', controller: locationController),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 114, vertical: 8),
              child: Row(
                children: [
                  Flexible(
                    child: TextFieldDialogWidget(
                      hintText: 'Nome Palestrante',
                      controller: speakerNameController,
                      padding: false,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: TextFieldDialogWidget(
                      hintText: 'Empresa',
                      controller: speakerCompanyController,
                      padding: false,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 114, vertical: 8),
              child: Flexible(
                child: TextFieldDialogWidget(
                  hintText: 'Bio',
                  controller: speakerBioController,
                  padding: false,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FormsButtonWidget(
                      buttonTittle: 'Cancelar',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      backgroundColor: AppColors.redButton),
                  const SizedBox(
                    width: 40,
                  ),
                  FormsButtonWidget(
                    buttonTittle: 'Criar',
                    onPressed: () {
                      if (isFilled()) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ActionConfirmationDialogWidget(
                                title: 'Tem certeza que deseja continuar?',
                                content:
                                    'Ao continuar novos dados serão criados no banco de dados alterando-o.',
                                onPressed: () {});
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const FillAllFieldsDialogWidget();
                          },
                        );
                      }
                    },
                    backgroundColor: AppColors.greenButton,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
