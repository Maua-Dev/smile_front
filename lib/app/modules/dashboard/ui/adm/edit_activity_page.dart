import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/edit_activity_controller.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/widgets/buttons/forms_button_widget.dart';
import '../../../../shared/widgets/dialogs/action_confirmation_dialog_widget.dart';
import '../../../../shared/widgets/dialogs/fill_all_fields_dialog_widget.dart';
import '../../../../shared/widgets/text-fields/drop_down_field_custom.dart';
import '../../../../shared/widgets/text_header_scratched.dart';
import '../../domain/infra/activity_enum.dart';
import '../../infra/models/speaker_activity_model.dart';
import '../widgets/text_field_dialog_widget.dart';

class EditActivityPage extends StatefulWidget {
  final ActivityModel selectedActivity;
  const EditActivityPage({Key? key, required this.selectedActivity})
      : super(key: key);

  @override
  State<EditActivityPage> createState() => _EditActivityPageState();
}

class _EditActivityPageState
    extends ModularState<EditActivityPage, EditActivityController> {
  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('dd-MM-yyyy').format(widget.selectedActivity.date);
    String formattedHour =
        DateFormat('hh:mm').format(widget.selectedActivity.date);
    var currentSelectedValue = widget.selectedActivity.type.name;
    var titleController =
        TextEditingController(text: widget.selectedActivity.title);
    var descriptionController =
        TextEditingController(text: widget.selectedActivity.description);
    var totalParticipantsController = TextEditingController(
        text: widget.selectedActivity.totalParticipants.toString());
    var dateController = TextEditingController(text: formattedDate);
    var hourController = TextEditingController(text: formattedHour);
    var locationController =
        TextEditingController(text: widget.selectedActivity.location);
    var speakerNameController =
        TextEditingController(text: widget.selectedActivity.speaker.name);
    var speakerCompanyController =
        TextEditingController(text: widget.selectedActivity.speaker.company);
    var speakerBioController =
        TextEditingController(text: widget.selectedActivity.speaker.bio);
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.75,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.lightBlueBorder, width: 5),
              borderRadius: BorderRadius.circular(25)),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 114, vertical: 8),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 114, vertical: 8),
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
                          controller: dateController,
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
                  hintText: 'Local', controller: locationController),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 114, vertical: 8),
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
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: TextFieldDialogWidget(
                        hintText: 'Bio',
                        controller: speakerBioController,
                        padding: false,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
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
                        buttonTittle: 'Salvar',
                        onPressed: () {
                          if (titleController.text != '' &&
                              descriptionController.text != '' &&
                              currentSelectedValue != '') {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ActionConfirmationDialogWidget(
                                    title: 'Tem certeza que deseja continuar?',
                                    content:
                                        'Ao salvar todos os dados antigos serão perdidos.',
                                    onPressed: () {
                                      controller.editActivity(
                                        widget.selectedActivity.id,
                                        ActivityModel.stringToEnumMap(
                                            currentSelectedValue),
                                        titleController.text,
                                        descriptionController.text,
                                        DateTime.parse(dateController.text),
                                        DateTime.parse(hourController.text),
                                        locationController.text,
                                        int.parse(
                                            totalParticipantsController.text),
                                        SpeakerActivityModel(
                                            name: '',
                                            bio: 'bio',
                                            company: 'company',
                                            linkPhoto: ''),
                                      );
                                    });
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
                        backgroundColor: AppColors.greenButton),
                    const SizedBox(
                      width: 40,
                    ),
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ActionConfirmationDialogWidget(
                                  title: 'Tem certeza que deseja continuar?',
                                  content:
                                      'Ao confirmar todos os dados antigos serão perdidos.',
                                  onPressed: () {
                                    controller.deleteActivity(
                                        widget.selectedActivity.id);
                                  });
                            },
                          );
                        },
                        icon: const Icon(
                          FontAwesome5.trash,
                          size: 32,
                        ),
                        padding: EdgeInsets.zero,
                        hoverColor: AppColors.lightBlue,
                        color: AppColors.brandingBlue),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
