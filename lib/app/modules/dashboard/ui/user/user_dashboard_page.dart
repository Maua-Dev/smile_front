import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/ui/widgets/activity_card_widget.dart';
import 'package:smile_front/app/shared/widgets/dashboard-appbar/dashboard_appbar_widget.dart';
import 'package:smile_front/app/shared/widgets/text-fields/drop_down_field_custom.dart';
import 'package:smile_front/app/shared/widgets/text-fields/text_field_custom.dart';
import 'package:smile_front/app/shared/widgets/text_header_scratched.dart';
import 'package:smile_front/app/shared/widgets/vertical_nav_bar/vertical_nav_bar.dart';
import '../../presenter/controllers/user/user_dashboard_controller.dart';

class UserDashboardPage extends StatefulWidget {
  const UserDashboardPage({Key? key}) : super(key: key);

  @override
  _UserDashboardPageState createState() => _UserDashboardPageState();
}

class _UserDashboardPageState
    extends ModularState<UserDashboardPage, UserDashboardController> {
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
                            // controller.orderByParticipants();
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
                          onTap: () {},
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
}
