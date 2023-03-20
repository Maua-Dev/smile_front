import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/edit_activity_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/add_forms/professor_add_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/app_bar/adm_app_bar_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/extensive_activity_button/extensive_activity_button.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/side_bar/side_bar_widget.dart';
import 'package:smile_front/app/shared/widgets/custom_elevated_button_widget.dart';
import 'package:smile_front/app/shared/widgets/dialogs/custom_alert_dialog_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../shared/entities/screen_variables.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/utils/screen_helper.dart';
import '../../../../shared/widgets/buttons/forms_button_widget.dart';
import '../../../../shared/widgets/dialogs/action_confirmation_dialog_widget.dart';
import '../../../../shared/widgets/text-fields/drop_down_field_custom.dart';
import '../../domain/infra/activity_enum.dart';
import 'widgets/add_forms/schedule_widget.dart';
import 'widgets/add_forms/speaker_add_widget.dart';
import 'widgets/add_forms/text_field_dialog_widget.dart';

class EditActivityPage extends StatefulWidget {
  const EditActivityPage({Key? key}) : super(key: key);

  @override
  State<EditActivityPage> createState() => _EditActivityPageState();
}

class _EditActivityPageState
    extends ModularState<EditActivityPage, EditActivityController> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(73),
          child:
              AdmAppBarWidget(appBarText: S.of(context).activityCreateTitle)),
      body: Row(
        children: [
          const SideBarWidget(),
          SizedBox(
            width: Screen.width(context) - 115,
            child: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 114, right: 114, top: 64, bottom: 8),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: DropDownFieldCustom<ActivityEnum>(
                                textStyles: AppTextStyles.body.copyWith(
                                    color: AppColors.brandingBlue,
                                    fontSize:
                                        MediaQuery.of(context).size.width < 1200
                                            ? 16
                                            : 20),
                                filledColor: Colors.white,
                                titulo: S.of(context).activity,
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
                                  validator: controller.validateRequiredField,
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
                              validator: controller.validateRequiredField,
                              labelText: S.of(context).activityNameTitle,
                              padding: false,
                              onChanged: controller.setTitle,
                              value: controller.activityToEdit.title,
                            )),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: ExtensiveActivityCheck(
                                onChanged: (() {
                                  setState(() {
                                    controller.setIsExtensive();
                                  });
                                }),
                                isExtensive:
                                    controller.activityToEdit.isExtensive,
                              ),
                            )
                          ],
                        ),
                      ),
                      TextFieldDialogWidget(
                        validator: controller.validateRequiredField,
                        labelText: S.of(context).descriptionTitle,
                        value: controller.activityToEdit.description,
                        onChanged: controller.setDescription,
                      ),
                      Observer(builder: (_) {
                        var closureDate = controller.activityToEdit
                                    .stopAcceptingNewEnrollmentsBefore ==
                                null
                            ? ''
                            : DateFormat('dd/MM/yyyy').format(controller
                                .activityToEdit
                                .stopAcceptingNewEnrollmentsBefore!);
                        var closureHour = controller.activityToEdit
                                    .stopAcceptingNewEnrollmentsBefore ==
                                null
                            ? ''
                            : DateFormat('HH:mm').format(controller
                                .activityToEdit
                                .stopAcceptingNewEnrollmentsBefore!);
                        var hour = controller.activityToEdit.startDate == null
                            ? ''
                            : DateFormat('HH:mm')
                                .format(controller.activityToEdit.startDate!);
                        var date = controller.activityToEdit.startDate == null
                            ? ''
                            : DateFormat('dd/MM/yyyy')
                                .format(controller.activityToEdit.startDate!);

                        return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 114),
                            child: ScheduleWidget(
                              closeInscriptionsHour: closureHour,
                              isValidSubscriptionclosureDate:
                                  controller.isValidSubscriptionclosureDate,
                              validateRequiredField:
                                  controller.validateRequiredField,
                              modality: controller.activityToEdit.deliveryEnum,
                              onChangedClosureDate: controller.setClosureDate,
                              onChangedClosureHour: controller.setClosureHour,
                              closeInscriptionsDate: closureDate,
                              onChangedModality: controller.setModality,
                              enableSubscription: controller
                                  .activityToEdit.acceptingNewEnrollments,
                              onChangedEnableSubscription: (valueBool) {
                                setState(() {
                                  controller.setEnableSubscription(valueBool!);
                                });
                              },
                              date: date,
                              hour: hour,
                              link: controller.activityToEdit.link,
                              onChangedLink: (value) {
                                controller.setLink(value);
                              },
                              location: controller.activityToEdit.place,
                              onChangedLocation: (value) {
                                controller.setLocation(value);
                              },
                              duration: controller.activityToEdit.duration,
                              onChangedDuration: (value) {
                                controller.setDuration(value);
                              },
                              length: 1,
                              totalParticipants:
                                  controller.activityToEdit.totalSlots,
                              onChangedParticipants: controller.setParticipants,
                              onChangedDate: (value) {
                                controller.setDate(value);
                              },
                              onChangedHour: (value) {
                                controller.setHour(value);
                              },
                              removeSchedule: () {},
                            ));
                      }),
                      Observer(builder: (_) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller
                              .activityToEdit.responsibleProfessors.length,
                          itemBuilder: (context, index) {
                            return ProfessorAddWidget(
                              removeProfessor: () {
                                controller.removeProfessor(index);
                                setState(() {});
                              },
                              onChangedProfessor: (value) {
                                controller.setResponsibleProfessorId(
                                    value, index);
                              },
                              responsibleProfessors:
                                  controller.allResponsibleProfessorsList,
                              validateRequiredField:
                                  controller.validateRequiredField,
                              length: controller
                                  .activityToEdit.responsibleProfessors.length,
                            );
                          },
                        );
                      }),
                      Padding(
                        padding: const EdgeInsets.only(left: 114, bottom: 24),
                        child: FormsButtonWidget(
                            width: 500,
                            buttonTittle: 'Adicionar Professor',
                            onPressed: controller.addResponsibleProfessor,
                            backgroundColor: AppColors.brandingBlue,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 22,
                            )),
                      ),
                      Observer(builder: (_) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.activityToEdit.speakers.length,
                          itemBuilder: (context, index) {
                            return SpeakerAddWidget(
                              validateRequiredField:
                                  controller.validateRequiredField,
                              length: controller.activityToEdit.speakers.length,
                              name: controller
                                  .activityToEdit.speakers[index].name,
                              bio:
                                  controller.activityToEdit.speakers[index].bio,
                              company: controller
                                  .activityToEdit.speakers[index].company,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 114),
                        child: FormsButtonWidget(
                            width: 500,
                            buttonTittle: S.of(context).speakersAddTitle,
                            onPressed: controller.addSpeaker,
                            backgroundColor: AppColors.brandingBlue,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 22,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 48, horizontal: 114),
                        child: Row(
                          children: [
                            CustomElevatedButtonWidget(
                                borderRadius: 8,
                                widthSize: Screen.width(context) > tabletSize
                                    ? Screen.width(context) * 0.35
                                    : Screen.width(context) * 0.3,
                                heightSize: 40,
                                title: 'Cancelar',
                                onPressed: () {
                                  Modular.to.navigate('/adm');
                                },
                                backgroundColor: AppColors.brandingBlue),
                            SizedBox(
                              width: Screen.width(context) > tabletSize
                                  ? 50
                                  : Screen.width(context) * 0.015,
                            ),
                            CustomElevatedButtonWidget(
                              borderRadius: 8,
                              title: 'Salvar',
                              widthSize: Screen.width(context) > tabletSize
                                  ? Screen.width(context) * 0.35
                                  : Screen.width(context) * 0.3,
                              heightSize: 40,
                              backgroundColor: AppColors.brandingBlue,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Observer(builder: (context) {
                                        return ActionConfirmationDialogWidget(
                                          isLoading: controller.isLoading,
                                          title:
                                              S.of(context).confirmToContinue,
                                          content:
                                              S.of(context).lostOldDataWarn,
                                          onPressed: () =>
                                              controller.editUserActivity(),
                                        );
                                      });
                                    },
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CustomAlertDialogWidget(
                                        title:
                                            S.of(context).fieldFillAllRequired,
                                        content: S
                                            .of(context)
                                            .confirmAllFieldsConrrectlyFilled,
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
