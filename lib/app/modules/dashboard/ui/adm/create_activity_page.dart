import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/widgets/buttons/forms_button_widget.dart';
import '../../../../shared/widgets/dialogs/action_confirmation_dialog_widget.dart';
import '../../../../shared/widgets/dialogs/fill_all_fields_dialog_widget.dart';
import '../../../../shared/widgets/text-fields/drop_down_field_custom.dart';
import '../../../../shared/widgets/text_header_scratched.dart';
import '../../domain/infra/activity_enum.dart';
import '../../presenter/controllers/adm/create_activity_controller.dart';
import '../widgets/add_photo_widget.dart';
import '../widgets/schedule_add_widget.dart';
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset('assets/images/maua_campus_blur.png',
                  fit: BoxFit.cover),
            ),
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
                    child: DropDownFieldCustom<ActivityEnum>(
                      textStyles: AppTextStyles.body.copyWith(
                          color: AppColors.brandingPurple, fontSize: 20),
                      filledColor: Colors.white,
                      titulo: 'Tipo de Atividade',
                      value: controller.activityToCreate.type,
                      items: ActivityEnum.values
                          .toList()
                          .map((ActivityEnum value) {
                        return DropdownMenuItem<ActivityEnum>(
                          value: value,
                          child: Text(value.name),
                        );
                      }).toList(),
                      onChanged: controller.setType,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                      child: TextFieldDialogWidget(
                    labelText: 'Titulo da Atividade',
                    padding: false,
                    onChanged: controller.setTitle,
                    value: controller.activityToCreate.title,
                  )),
                ],
              ),
            ),
            TextFieldDialogWidget(
              labelText: 'Descrição',
              value: controller.activityToCreate.description,
              onChanged: controller.setDescription,
            ),
            Observer(builder: (_) {
              return Flexible(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.activityToCreate.schedule.length,
                    itemBuilder: (context, index) {
                      var hour =
                          controller.activityToCreate.schedule[index].date ==
                                  null
                              ? ''
                              : DateFormat('HH:mm').format(controller
                                  .activityToCreate.schedule[index].date!);
                      var date =
                          controller.activityToCreate.schedule[index].date ==
                                  null
                              ? ''
                              : DateFormat('dd-MM-yyyy').format(controller
                                  .activityToCreate.schedule[index].date!);
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 114, vertical: 8),
                        child: ScheduleAddWidget(
                          totalParticipants: controller.activityToCreate
                              .schedule[index].totalParticipants,
                          date: date,
                          hour: hour,
                          onChangedDate: (value) {
                            controller.setDate(value, index);
                          },
                          onChangedHour: (value) {
                            controller.setHour(value, index);
                          },
                          onChangedParticipants: (value) {
                            controller.setParticipants(int.parse(value), index);
                          },
                          removeSchedule: () {
                            controller.removeSchedule(index);
                            setState(() {});
                          },
                        ),
                      );
                    }),
              );
            }),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 114, vertical: 8),
                child: FormsButtonWidget(
                    buttonTittle: 'Adicionar',
                    onPressed: controller.addSchedule,
                    backgroundColor: AppColors.brandingOrange,
                    icon: const Icon(Icons.add, color: Colors.white, size: 22)),
              ),
            ),
            TextFieldDialogWidget(
              labelText: 'Local/Link',
              value: controller.activityToCreate.location,
              onChanged: controller.setLocation,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 114, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AddPhotoWidget(),
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: TextFieldDialogWidget(
                                labelText: 'Nome Palestrante',
                                padding: false,
                                onChanged: controller.setSpeakerName,
                                value: controller.activityToCreate.speaker.name,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Flexible(
                              child: TextFieldDialogWidget(
                                labelText: 'Empresa',
                                onChanged: controller.setSpeakerCompany,
                                value:
                                    controller.activityToCreate.speaker.company,
                                padding: false,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: TextFieldDialogWidget(
                            labelText: 'Bio',
                            value: controller.activityToCreate.speaker.bio,
                            onChanged: controller.setSpeakerBio,
                            padding: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
                      buttonTittle: 'Salvar',
                      onPressed: () {
                        if (controller.isFilled()) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ActionConfirmationDialogWidget(
                                  title: 'Tem certeza que deseja continuar?',
                                  content:
                                      'Ao salvar todos os dados antigos serão perdidos.',
                                  onPressed: () {
                                    controller.createActivity();
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
