import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/edit_activity_controller.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/utils/s3_assets_url.dart';
import '../../../../shared/widgets/buttons/forms_button_widget.dart';
import '../../../../shared/widgets/dialogs/action_confirmation_dialog_widget.dart';
import '../../../../shared/widgets/dialogs/fill_all_fields_dialog_widget.dart';
import '../../../../shared/widgets/text-fields/drop_down_field_custom.dart';
import '../../../../shared/widgets/text-header/text_header.dart';
import '../../domain/infra/activity_enum.dart';
import '../widgets/schedule_add_widget.dart';
import '../widgets/speaker_add_widget.dart';
import '../widgets/text_field_dialog_widget.dart';

class EditActivityPage extends StatefulWidget {
  const EditActivityPage({Key? key}) : super(key: key);

  @override
  State<EditActivityPage> createState() => _EditActivityPageState();
}

class _EditActivityPageState
    extends ModularState<EditActivityPage, EditActivityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(mauaCampusBlurUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: TextHeader(
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
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: DropDownFieldCustom<ActivityEnum>(
                        textStyles: AppTextStyles.body.copyWith(
                            color: AppColors.brandingPurple, fontSize: 20),
                        filledColor: Colors.white,
                        titulo: 'Tipo de Atividade',
                        value: controller.activityToEdit.type,
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
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: TextFieldDialogWidget(
                          labelText: 'Código',
                          padding: false,
                          onChanged: controller.setActivityCode,
                          value: controller.activityToEdit.activityCode,
                        )),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                        child: TextFieldDialogWidget(
                      labelText: 'Titulo da Atividade',
                      padding: false,
                      onChanged: controller.setTitle,
                      value: controller.activityToEdit.title,
                    )),
                  ],
                ),
              ),
              TextFieldDialogWidget(
                labelText: 'Descrição',
                value: controller.activityToEdit.description,
                onChanged: controller.setDescription,
              ),
              Observer(builder: (_) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.activityToEdit.schedule.length,
                    itemBuilder: (context, index) {
                      var hour = controller
                                  .activityToEdit.schedule[index].date ==
                              null
                          ? ''
                          : DateFormat('HH:mm').format(
                              controller.activityToEdit.schedule[index].date!);
                      var date = controller
                                  .activityToEdit.schedule[index].date ==
                              null
                          ? ''
                          : DateFormat('dd-MM-yyyy').format(
                              controller.activityToEdit.schedule[index].date!);
                      var duration =
                          controller.activityToEdit.schedule[index].duration ==
                                  null
                              ? ''
                              : DateFormat('HH:mm').format(controller
                                  .activityToEdit.schedule[index].duration!);
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 114, vertical: 8),
                        child: ScheduleAddWidget(
                          date: date,
                          hour: hour,
                          link: controller.activityToEdit.schedule[index].link,
                          onChangedLink: (value) {
                            controller.setLink(value, index);
                          },
                          location: controller
                              .activityToEdit.schedule[index].location,
                          onChangedLocation: (value) {
                            controller.setLocation(value, index);
                          },
                          duration: duration,
                          onChangedDuration: (value) {
                            controller.setDuration(value, index);
                          },
                          length: controller.activityToEdit.schedule.length,
                          totalParticipants: controller
                              .activityToEdit.schedule[index].totalParticipants,
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
                          onPressedIconDate: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2023),
                              confirmText: 'CONFIRMAR',
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    primaryColor: AppColors.brandingOrange,
                                    colorScheme: ColorScheme.light(
                                        primary: AppColors.brandingOrange),
                                  ),
                                  child: child!,
                                );
                              },
                            ).then((value) {
                              controller.setDate(
                                  DateFormat('dd-MM-yyyy').format(value!),
                                  index);
                            });
                          },
                          onPressedIconTime: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                              confirmText: 'CONFIRMAR',
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    primaryColor: AppColors.brandingOrange,
                                    colorScheme: ColorScheme.light(
                                        primary: AppColors.brandingOrange),
                                  ),
                                  child: child!,
                                );
                              },
                            ).then((value) {
                              controller.setHour(value!.format(context), index);
                            });
                          },
                        ),
                      );
                    });
              }),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 114, vertical: 16),
                  child: FormsButtonWidget(
                      buttonTittle: 'Adicionar novo horário',
                      onPressed: controller.addSchedule,
                      backgroundColor: AppColors.brandingOrange,
                      icon:
                          const Icon(Icons.add, color: Colors.white, size: 22)),
                ),
              ),
              Observer(builder: (_) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.activityToEdit.speaker.length,
                  itemBuilder: (context, index) {
                    return SpeakerAddWidget(
                      length: controller.activityToEdit.speaker.length,
                      name: controller.activityToEdit.speaker[index].name,
                      bio: controller.activityToEdit.speaker[index].bio,
                      company: controller.activityToEdit.speaker[index].company,
                      onChangedName: (value) {
                        controller.setSpeakerName(value, index);
                      },
                      onChangedBio: (value) {
                        controller.setSpeakerBio(value, index);
                      },
                      onChangedCompany: (value) {
                        controller.setSpeakerCompany(value, index);
                      },
                      removeSpeaker: () {
                        controller.removeSpeaker(index);
                        setState(() {});
                      },
                    );
                  },
                );
              }),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 114),
                  child: FormsButtonWidget(
                      buttonTittle: 'Adicionar palestrante',
                      onPressed: controller.addSpeaker,
                      backgroundColor: AppColors.brandingOrange,
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 22,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ActionConfirmationDialogWidget(
                                  isLoading: controller.isLoading,
                                  title: 'Tem certeza que deseja continuar?',
                                  content:
                                      'Ao confirmar todos os dados antigos serão perdidos.',
                                  onPressed: () {
                                    controller.deleteActivity(
                                        controller.activityToEdit.id);
                                  });
                            },
                          );
                        },
                        icon: const Icon(
                          FontAwesome5.trash,
                          size: 32,
                        ),
                        padding: EdgeInsets.zero,
                        hoverColor: AppColors.lightPurple,
                        color: AppColors.brandingPurple),
                    const SizedBox(
                      width: 40,
                    ),
                    FormsButtonWidget(
                        buttonTittle: 'Cancelar',
                        onPressed: () {
                          Modular.to.navigate('/adm');
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
                                    isLoading: controller.isLoading,
                                    title: 'Tem certeza que deseja continuar?',
                                    content:
                                        'Ao salvar todos os dados antigos serão perdidos.',
                                    onPressed: () {
                                      controller.editActivity();
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
      ),
    );
  }
}
