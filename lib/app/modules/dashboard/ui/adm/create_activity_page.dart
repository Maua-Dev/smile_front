import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/add_forms/speaker_add_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/utils/s3_assets_url.dart';
import '../../../../shared/widgets/buttons/forms_button_widget.dart';
import '../../../../shared/widgets/dialogs/action_confirmation_dialog_widget.dart';
import '../../../../shared/widgets/dialogs/custom_alert_dialog_widget.dart';
import '../../../../shared/widgets/text-fields/drop_down_field_custom.dart';
import '../../../../shared/widgets/text-header/text_header.dart';
import '../../domain/infra/activity_enum.dart';
import '../../presenter/controllers/adm/create_activity_controller.dart';
import 'widgets/add_forms/schedule_add_widget.dart';
import 'widgets/add_forms/text_field_dialog_widget.dart';

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
                      image: CachedNetworkImageProvider(mauaCampusBlurUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: TextHeader(
                  title: 'Criar Atividade',
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
                            color: AppColors.brandingBlue,
                            fontSize: MediaQuery.of(context).size.width < 1200
                                ? 16
                                : 20),
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
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: TextFieldDialogWidget(
                          labelText: 'Código',
                          padding: false,
                          onChanged: controller.setActivityCode,
                          value: controller.activityToCreate.activityCode,
                        )),
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
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      var hour =
                          controller.activityToCreate.schedule.date == null
                              ? ''
                              : DateFormat('HH:mm').format(
                                  controller.activityToCreate.schedule.date!);
                      var date =
                          controller.activityToCreate.schedule.date == null
                              ? ''
                              : DateFormat('dd-MM-yyyy').format(
                                  controller.activityToCreate.schedule.date!);
                      var duration = controller
                                  .activityToCreate.schedule.duration ==
                              null
                          ? ''
                          : DateFormat('HH:mm').format(
                              controller.activityToCreate.schedule.duration!);
                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 114, vertical: 8),
                          child: ScheduleAddWidget(
                            enableSubscription: controller
                                .activityToCreate.schedule.acceptSubscription,
                            onChangedEnableSubscription: (valueBool) {
                              setState(() {
                                controller.setEnableSubscription(
                                    valueBool!, index);
                              });
                            },
                            date: date,
                            hour: hour,
                            link: controller.activityToCreate.schedule.link,
                            onChangedLink: (value) {
                              controller.setLink(value, index);
                            },
                            location:
                                controller.activityToCreate.schedule.location,
                            onChangedLocation: (value) {
                              controller.setLocation(value, index);
                            },
                            duration: duration,
                            onChangedDuration: (value) {
                              controller.setDuration(value, index);
                            },
                            length: 1,
                            totalParticipants: controller
                                .activityToCreate.schedule.totalParticipants,
                            onChangedDate: (value) {
                              controller.setDate(value, index);
                            },
                            onChangedHour: (value) {
                              controller.setHour(value, index);
                            },
                            onChangedParticipants: (value) {
                              controller.setParticipants(
                                  int.parse(value), index);
                            },
                            removeSchedule: () {},
                            onPressedIconDate: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2022),
                                lastDate: DateTime(2023),
                                confirmText:
                                    S.of(context).confirmTitle.toUpperCase(),
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
                                confirmText:
                                    S.of(context).confirmTitle.toUpperCase(),
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
                                controller.setHour(
                                    value!.format(context), index);
                              });
                            },
                          ));
                    });
              }),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 114, vertical: 16),
                  child: FormsButtonWidget(
                    buttonTittle: 'Adicionar horário',
                    onPressed: () {},
                    backgroundColor: AppColors.brandingOrange,
                    icon: const Icon(Icons.add, color: Colors.white, size: 22),
                  ),
                ),
              ),
              Observer(builder: (_) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.activityToCreate.speakers.length,
                  itemBuilder: (context, index) {
                    return SpeakerAddWidget(
                      length: controller.activityToCreate.speakers.length,
                      name: controller.activityToCreate.speakers[index].name,
                      bio: controller.activityToCreate.speakers[index].bio,
                      company:
                          controller.activityToCreate.speakers[index].company,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 114, vertical: 8),
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
                                return Observer(builder: (context) {
                                  return ActionConfirmationDialogWidget(
                                      isLoading: controller.isLoading,
                                      title:
                                          'Tem certeza que deseja continuar?',
                                      content:
                                          'Ao salvar o banco de dados de atividade será alterado.',
                                      onPressed: () {
                                        controller.createUserActivity();
                                      });
                                });
                              },
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const CustomAlertDialogWidget(
                                  title: 'Preencha todos os campos!',
                                  content:
                                      'Confira se todos os campos estão corretamente preenchidos.',
                                );
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
