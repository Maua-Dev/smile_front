import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/widgets/activity_card_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/widgets/text_field_dialog_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/widgets/dialogs/action_confirmation_dialog_widget.dart';
import '../../../../shared/entities/activity.dart';
import '../../../../shared/models/activity_model.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/widgets/buttons/forms_button_widget.dart';
import '../../../../shared/widgets/dialogs/fill_all_fields_dialog_widget.dart';
import '../../../../shared/widgets/text-fields/drop_down_field_custom.dart';
import '../../../../shared/widgets/text-fields/text_field_custom.dart';
import '../../../../shared/widgets/text_header_scratched.dart';
import '../../domain/infra/activity_enum.dart';

class AdmDashboardPage extends StatefulWidget {
  const AdmDashboardPage({Key? key}) : super(key: key);

  @override
  State<AdmDashboardPage> createState() => _AdmDashboardPageState();
}

class _AdmDashboardPageState
    extends ModularState<AdmDashboardPage, AdmDashboardController> {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController(text: '');
    // ignore: prefer_typing_uninitialized_variables
    var currentSelectedValue;
    const orders = ['Ordenar', 'Por data', 'Por inscritos'];
    return Scaffold(
      body: Material(
          child: Row(children: [
        Expanded(
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              const TextHeaderScratched(title: 'Próximas Atividades'),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 78, vertical: 32),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    child: Observer(builder: (_) {
                      return GridView.builder(
                          itemCount: controller.activitiesList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      MediaQuery.of(context).size.width < 1350
                                          ? 2
                                          : 3,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 8,
                                  childAspectRatio: 1.7),
                          itemBuilder: (context, index) {
                            String date = DateFormat('dd/MM/yyyy')
                                .format(controller.activitiesList[index].date);
                            String time = DateFormat('hh:mm')
                                .format(controller.activitiesList[index].date);
                            return ActivityCardWidget(
                              name: controller.activitiesList[index].name,
                              date: date,
                              description:
                                  controller.activitiesList[index].description,
                              maxParticipants: controller
                                  .activitiesList[index].totalPlaces
                                  .toString(),
                              totalParticipants: controller
                                  .activitiesList[index].totalPlaces
                                  .toString(),
                              time: time,
                              onTap: () {
                                showCustomEditDialog(
                                    context, controller.activitiesList[index]);
                              },
                            );
                          });
                    }),
                  ),
                ),
              ),
            ],
          ),
        )
      ])),
      floatingActionButton: Observer(builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (controller.isFloatActionButtonOpen)
              Padding(
                padding: const EdgeInsets.only(right: 36.0),
                child: SizedBox(
                  width: 70,
                  child: FittedBox(
                    child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.insert_chart_rounded,
                          size: 35,
                          color: AppColors.brandingBlue,
                        ),
                        onPressed: () {}),
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            if (controller.isFloatActionButtonOpen)
              Padding(
                padding: const EdgeInsets.only(right: 36.0),
                child: SizedBox(
                  width: 70,
                  child: FittedBox(
                    child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.edit,
                          size: 35,
                          color: AppColors.brandingBlue,
                        ),
                        onPressed: () {}),
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 36.0, bottom: 36.0),
              child: SizedBox(
                width: 100,
                child: FittedBox(
                  child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: Icon(
                        controller.isFloatActionButtonOpen
                            ? Icons.close
                            : Icons.add,
                        color: AppColors.brandingBlue,
                      ),
                      onPressed: () {
                        controller.toggleFloatActionButton();
                      }),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  void showCustomEditDialog(BuildContext context, Activity selectedActivity) {
    String formattedDate =
        DateFormat('yyyy-MM-ddThh:mm').format(selectedActivity.date);
    // ignore: prefer_typing_uninitialized_variables
    var currentSelectedValue = selectedActivity.type.name;
    var titleController = TextEditingController(text: selectedActivity.name);
    var descriptionController =
        TextEditingController(text: selectedActivity.description);
    var numberOfPeopleController =
        TextEditingController(text: selectedActivity.totalPlaces.toString());
    var dateController = TextEditingController(text: formattedDate);
    var workloadController =
        TextEditingController(text: selectedActivity.workload.toString());
    var locationController =
        TextEditingController(text: selectedActivity.location);
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (_, __, ___) {
        return Center(
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
                  child: Material(
                    color: Colors.white,
                    child: TextHeaderScratched(
                      title: 'Editar Atividade',
                      leftPadding: 24,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 114, vertical: 8),
                  child: SizedBox(
                    width: 500,
                    child: Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
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
                  ),
                ),
                TextFieldDialogWidget(
                    hintText: 'Titulo da Atividade',
                    controller: titleController),
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
                          controller: numberOfPeopleController,
                          padding: false,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        child: TextFieldDialogWidget(
                            hintText: 'Data (AAAA-MM-DD HH:MM)',
                            controller: dateController,
                            padding: false,
                            inputFormatters: [
                              MaskTextInputFormatter(
                                mask: '####-##-##T##:##',
                              )
                            ]),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        child: TextFieldDialogWidget(
                          hintText: 'Carga Horária',
                          controller: workloadController,
                          padding: false,
                        ),
                      ),
                    ],
                  ),
                ),
                TextFieldDialogWidget(
                    hintText: 'Local', controller: locationController),
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
                                      title:
                                          'Tem certeza que deseja continuar?',
                                      content:
                                          'Ao salvar todos os dados antigos serão perdidos.',
                                      onPressed: () {
                                        controller.editActivity(
                                          selectedActivity.id,
                                          descriptionController.text,
                                          selectedActivity.link ?? '',
                                          int.parse(
                                              numberOfPeopleController.text),
                                          locationController.text,
                                          titleController.text,
                                          DateTime.parse(dateController.text),
                                          ActivityModel.stringToEnumMap(
                                              currentSelectedValue),
                                          int.parse(workloadController.text),
                                        );

                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                        setState(() {
                                          controller.getAllActivities();
                                        });
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
                      Material(
                        color: Colors.white,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ActionConfirmationDialogWidget(
                                      title:
                                          'Tem certeza que deseja continuar?',
                                      content:
                                          'Os dados da atividade serão perdidos.',
                                      onPressed: () {
                                        controller.deleteActivity(
                                            selectedActivity.id);

                                        Navigator.of(context).pop();
                                        setState(() async {
                                          await controller.getAllActivities();
                                        });
                                      });
                                },
                              );
                            },
                            icon: const Icon(
                              FontAwesome5.trash,
                              size: 32,
                            ),
                            hoverColor: AppColors.lightBlue,
                            color: AppColors.brandingBlue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}
