import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/edit_activity_controller.dart';
import 'package:smile_front/app/shared/widgets/dialogs/custom_alert_dialog_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/utils/s3_assets_url.dart';
import '../../../../shared/widgets/buttons/forms_button_widget.dart';
import '../../../../shared/widgets/dialogs/action_confirmation_dialog_widget.dart';
import '../../../../shared/widgets/text-fields/drop_down_field_custom.dart';
import '../../../../shared/widgets/text-header/text_header.dart';
import '../../domain/infra/activity_enum.dart';
import 'widgets/add_forms/schedule_add_widget.dart';
import 'widgets/add_forms/speaker_add_widget.dart';
import 'widgets/add_forms/text_field_dialog_widget.dart';

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
                      image: CachedNetworkImageProvider(mauaCampusBlurUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: TextHeader(
                  title: S.of(context).activityEditTitle,
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
                        titulo: S.of(context).activityTypeTitle,
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
                          labelText: S.of(context).codeTitle,
                          padding: false,
                          onChanged: controller.setActivityCode,
                          value: controller.activityToEdit.activityCode,
                        )),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                        child: TextFieldDialogWidget(
                      labelText: S.of(context).activityNameTitle,
                      padding: false,
                      onChanged: controller.setTitle,
                      value: controller.activityToEdit.title,
                    )),
                  ],
                ),
              ),
              TextFieldDialogWidget(
                labelText: S.of(context).descriptionTitle,
                value: controller.activityToEdit.description,
                onChanged: controller.setDescription,
              ),
              Observer(builder: (_) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      var hour = controller.activityToEdit.schedule.date == null
                          ? ''
                          : DateFormat('HH:mm')
                              .format(controller.activityToEdit.schedule.date!);
                      var date = controller.activityToEdit.schedule.date == null
                          ? ''
                          : DateFormat('dd-MM-yyyy')
                              .format(controller.activityToEdit.schedule.date!);
                      var duration =
                          controller.activityToEdit.schedule.duration == null
                              ? ''
                              : DateFormat('HH:mm').format(
                                  controller.activityToEdit.schedule.duration!);
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 114, vertical: 8),
                        child: ScheduleAddWidget(
                          enableSubscription: controller
                              .activityToEdit.schedule.acceptSubscription,
                          onChangedEnableSubscription: (valueBool) {
                            setState(() {
                              controller.setEnableSubscription(
                                  valueBool!, index);
                            });
                          },
                          date: date,
                          hour: hour,
                          link: controller.activityToEdit.schedule.link,
                          onChangedLink: (value) {
                            controller.setLink(value, index);
                          },
                          location: controller.activityToEdit.schedule.location,
                          onChangedLocation: (value) {
                            controller.setLocation(value, index);
                          },
                          duration: duration,
                          onChangedDuration: (value) {
                            controller.setDuration(value, index);
                          },
                          length: 1,
                          totalParticipants: controller
                              .activityToEdit.schedule.totalParticipants,
                          onChangedDate: (value) {
                            controller.setDate(value, index);
                          },
                          onChangedHour: (value) {
                            controller.setHour(value, index);
                          },
                          onChangedParticipants: (value) {
                            controller.setParticipants(int.parse(value), index);
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
                      buttonTittle: S.of(context).scheduleAddTitle,
                      onPressed: () {},
                      backgroundColor: AppColors.brandingOrange,
                      icon:
                          const Icon(Icons.add, color: Colors.white, size: 22)),
                ),
              ),
              Observer(builder: (_) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.activityToEdit.speakers.length,
                  itemBuilder: (context, index) {
                    return SpeakerAddWidget(
                      length: controller.activityToEdit.speakers.length,
                      name: controller.activityToEdit.speakers[index].name,
                      bio: controller.activityToEdit.speakers[index].bio,
                      company:
                          controller.activityToEdit.speakers[index].company,
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
                      buttonTittle: S.of(context).speakersAddTitle,
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
                        buttonTittle: S.of(context).cancelTitle,
                        onPressed: () {
                          Modular.to.navigate('/adm');
                        },
                        backgroundColor: AppColors.redButton),
                    const SizedBox(
                      width: 40,
                    ),
                    FormsButtonWidget(
                        buttonTittle: S.of(context).saveTitle,
                        onPressed: () {
                          if (controller.isFilled()) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Observer(builder: (context) {
                                  return ActionConfirmationDialogWidget(
                                      isLoading: controller.isLoading,
                                      title: S.of(context).confirmToContinue,
                                      content: S.of(context).lostOldDataWarn,
                                      onPressed: () {
                                        controller.editUserActivity();
                                      });
                                });
                              },
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomAlertDialogWidget(
                                  title: S.of(context).fieldFillAllRequired,
                                  content: S
                                      .of(context)
                                      .confirmAllFieldsConrrectlyFilled,
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
