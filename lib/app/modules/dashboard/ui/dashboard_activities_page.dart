import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/widgets/activity_card_widget.dart';
import 'package:smile_front/app/shared/entities/activity.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/app/shared/widgets/buttons/forms_button_widget.dart';
import 'package:smile_front/app/shared/widgets/dashboard-appbar/dashboard_appbar_widget.dart';
import 'package:smile_front/app/shared/widgets/text-fields/drop_down_field_custom.dart';
import 'package:smile_front/app/shared/widgets/text-fields/text_field_custom.dart';
import 'package:smile_front/app/shared/widgets/text_header_scratched.dart';
import 'package:smile_front/app/shared/widgets/vertical_nav_bar/vertical_nav_bar.dart';

class DashboardActivitiesPage extends StatefulWidget {
  const DashboardActivitiesPage({Key? key}) : super(key: key);

  @override
  _DashboardActivitiesPageState createState() =>
      _DashboardActivitiesPageState();
}

class _DashboardActivitiesPageState
    extends ModularState<DashboardActivitiesPage, DashboardController> {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController(text: '');
    // ignore: prefer_typing_uninitialized_variables
    var currentSelectedValue;
    const orders = ['Ordenar', 'Por data', 'Por inscritos'];
    return Material(
        child: Row(children: [
      VerticalNavBar(),
      Expanded(
        child: Column(
          children: [
            const DashboardAppbarWidget(),
            const TextHeaderScratched(title: 'Atividades'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFieldCustom(
                    titulo: 'Buscar',
                    value: searchController.text,
                    onChanged: controller.searchActivityByName,
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  DropDownFieldCustom<String>(
                    titulo: 'Ordenar',
                    items: orders.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: currentSelectedValue,
                    onChanged: (newValue) {
                      setState(() {
                        currentSelectedValue = newValue;
                        switch (newValue) {
                          case 'Ordenar':
                            controller.getActivitiesByType();
                            break;
                          case 'Por data':
                            controller.orderByDate();
                            break;
                          case 'Por inscritos':
                            controller.orderByParticipants();
                            break;
                        }
                      });
                    },
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
                child: Observer(builder: (_) {
                  return GridView.builder(
                      itemCount: controller.activitiesList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
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
                              .activitiesList[index].enrolledUsers.length
                              .toString(),
                          time: time,
                          onTap: () {
                            if (controller.accessLevel == 'ADMIN') {
                              showCustomEditDialog(
                                  context, controller.activitiesList[index]);
                            } else {
                              showCustomMoreInfoDialog(
                                  context, controller.activitiesList[index]);
                            }
                          },
                        );
                      });
                }),
              ),
            ),
          ],
        ),
      )
    ]));
  }

  void showCustomEditDialog(BuildContext context, Activity selectedActivity) {
    // ignore: prefer_typing_uninitialized_variables
    var currentSelectedValue;
    var titleController = TextEditingController(text: '');
    var descriptionController = TextEditingController(text: '');
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
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
                color: AppColors.brandingBlue,
                border: Border.all(color: AppColors.lightBlueBorder, width: 5),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    color: AppColors.brandingBlue,
                    child: const TextHeaderScratched(
                      title: 'Editar Atividade',
                      color: Colors.white,
                      leftPadding: 24,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 114, vertical: 8),
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: TextField(
                      controller: titleController,
                      style: AppTextStyles.body.copyWith(
                          color: AppColors.brandingBlue, fontSize: 20),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          hintText: 'Título da Atividade',
                          hintStyle: AppTextStyles.body.copyWith(
                              color: AppColors.brandingBlue, fontSize: 20),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          filled: true,
                          fillColor: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 114, vertical: 8),
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: TextField(
                      controller: descriptionController,
                      style: AppTextStyles.body.copyWith(
                          color: AppColors.brandingBlue, fontSize: 20),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          hintText: 'Descrição',
                          hintStyle: AppTextStyles.body.copyWith(
                              color: AppColors.brandingBlue, fontSize: 20),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          filled: true,
                          fillColor: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 114, vertical: 8),
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: SizedBox(
                      width: 500,
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
                          currentSelectedValue = newValue;
                        },
                      ),
                    ),
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
                                currentSelectedValue != null) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  // retorna um objeto do tipo Dialog
                                  return AlertDialog(
                                    title: const Text(
                                        'Tem certeza que deseja salvar?'),
                                    content: const Text(
                                        'Ao salvar todos os dados antigos serão perdidos.'),
                                    actions: [
                                      ElevatedButton(
                                        child: const Text('Fechar'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      ElevatedButton(
                                        child: const Text('Salvar'),
                                        onPressed: () {
                                          controller.editActivity(
                                              titleController.text,
                                              descriptionController.text,
                                              currentSelectedValue,
                                              selectedActivity.id,
                                              selectedActivity.workload,
                                              selectedActivity.totalPlaces ??
                                                  0);
                                          controller.getActivitiesByType();
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title:
                                        const Text('Preencha todos os campos!'),
                                    content: const Text(
                                        'Confira se todos os campos estão corretamente preenchidos.'),
                                    actions: [
                                      ElevatedButton(
                                        child: const Text('Fechar'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
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

  void showCustomMoreInfoDialog(
      BuildContext context, Activity selectedActivity) {
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
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
                color: AppColors.brandingBlue,
                border: Border.all(color: AppColors.lightBlueBorder, width: 5),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    color: AppColors.brandingBlue,
                    child: TextHeaderScratched(
                      title: selectedActivity.name,
                      color: Colors.white,
                      leftPadding: 24,
                    ),
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
