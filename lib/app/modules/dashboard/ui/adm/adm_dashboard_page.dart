import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/adm_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/widgets/activity_card_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../../shared/widgets/text-fields/text_field_custom.dart';
import '../../../../shared/widgets/text_header_scratched.dart';

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
    // ignore: unused_local_variable
    var currentSelectedValue = '';
    // ignore: unused_local_variable
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
              const TextHeaderScratched(title: 'Atividades'),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.16,
                    vertical: 24),
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
                    // DropDownFieldCustom<String>(
                    //   titulo: 'Ordenar',
                    //   items: orders.map((String value) {
                    //     return DropdownMenuItem<String>(
                    //       value: value,
                    //       child: Text(value),
                    //     );
                    //   }).toList(),
                    //   value: currentSelectedValue,
                    //   onChanged: (newValue) {
                    //     setState(() {
                    //       currentSelectedValue = newValue!;
                    //       switch (newValue) {
                    //         case 'Ordenar':
                    //           // controller.getActivitiesByType();
                    //           break;
                    //         case 'Por data':
                    //           controller.orderByDate();
                    //           break;
                    //         case 'Por inscritos':
                    //           // controller.orderByParticipants();
                    //           break;
                    //       }
                    //     });
                    //   },
                    // )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.6,
                    ),
                    child: Observer(builder: (_) {
                      return GridView.builder(
                          itemCount: controller.activitiesList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 8,
                                  childAspectRatio: 1.7),
                          itemBuilder: (context, index) {
                            String date = DateFormat('dd/MM/yyyy')
                                .format(controller.activitiesList[index].date);
                            String time = DateFormat('hh:mm')
                                .format(controller.activitiesList[index].date);
                            return ActivityCardWidget(
                              name: controller.activitiesList[index].title,
                              date: date,
                              description:
                                  controller.activitiesList[index].description,
                              maxParticipants: controller
                                  .activitiesList[index].totalParticipants
                                  .toString(),
                              totalParticipants: controller
                                  .activitiesList[index].totalParticipants
                                  .toString(),
                              time: time,
                              onTap: () {
                                Modular.to.pushNamed('/adm/edit-activity',
                                    arguments:
                                        controller.activitiesList[index]);
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
                        onPressed: () {
                          Modular.to.pushNamed('/adm/create-activity');
                        }),
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
}
