import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/widgets/activity_card_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
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
                            showCustomDialog(context);
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

  void showCustomDialog(BuildContext context) {
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
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: AppColors.brandingBlue,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                const TextHeaderScratched(
                  title: 'Editar Atividade',
                  color: Colors.white,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 114, vertical: 4),
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintText: 'Enter a search term',
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          filled: true,
                          fillColor: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 114, vertical: 4),
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintText: 'Enter a search term',
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          filled: true,
                          fillColor: Colors.white),
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
