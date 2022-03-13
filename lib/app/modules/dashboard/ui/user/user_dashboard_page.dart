import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/ui/widgets/activity_card_widget.dart';
import 'package:smile_front/app/shared/widgets/dashboard-appbar/dashboard_appbar_widget.dart';
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
                  //       currentSelectedValue = newValue;
                  //       switch (newValue) {
                  //         case 'Ordenar':
                  //           controller.getActivitiesByType();
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
                        return ActivityCardWidget(
                          cardColor: Colors.white,
                          name: controller.activitiesList[index].title,
                          description:
                              controller.activitiesList[index].description,
                          date: controller
                              .activitiesList[index].schedule[0].date
                              .toString(),
                          time: controller
                              .activitiesList[index].schedule[0].hour
                              .toString(),
                          totalParticipants: '20',
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
