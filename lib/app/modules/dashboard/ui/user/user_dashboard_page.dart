import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_web.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/user_data/user_data_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/user_weekday/user_activity_card_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/app/shared/widgets/text-header/text_header.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/bottom_navigation_bar/bottom_navigation_bar_controller.dart';
import '../../presenter/controllers/user/user_dashboard_controller.dart';
import 'widgets/next_activity/next_activity_card_widget.dart';
import 'widgets/user_weekday/user_weekday_filter_widget.dart';

class UserDashboardPage extends StatefulWidget {
  const UserDashboardPage({Key? key}) : super(key: key);

  @override
  State<UserDashboardPage> createState() => _UserDashboardPageState();
}

class _UserDashboardPageState
    extends ModularState<UserDashboardPage, UserDashboardController> {
  var navBarController = Modular.get<NavigationBarController>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (controller.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else {
        if (controller.subscribedActivitiesList.isNotEmpty &&
            controller.nextActivity.type != null) {
          return Scaffold(
              body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                UserDataWidget(
                  logout: () {
                    navBarController.logout();
                  },
                  controller: controller,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextHeader(
                  title: 'Sua próxima atividade',
                  fontSize: MediaQuery.of(context).size.width < 500
                      ? 28
                      : MediaQuery.of(context).size.width < 1000
                          ? 30
                          : 38,
                  leftPadding:
                      MediaQuery.of(context).size.width < 1000 ? 12 : 8,
                ),
                Observer(builder: (_) {
                  return NextActivityCardWidget(
                    isUser: true,
                    link: controller.nextActivity.schedule[0].link,
                    location: controller.nextActivity.schedule[0].location,
                    duration: controller.nextActivity.schedule[0].duration,
                    onTap: () {
                      var isRegistered = false;
                      var list = controller.subscribedActivitiesList
                          .where((element) =>
                              element.id == controller.cardNextActivity.id)
                          .toList();
                      if (list.isNotEmpty) {
                        isRegistered = true;
                      }
                      Modular.to.navigate('/user/home/more-info', arguments: [
                        controller.cardNextActivity,
                        isRegistered
                      ]);
                      controller.analytics.logViewActivity(
                          controller.cardNextActivity.activityCode);
                    },
                    name: controller.nextActivity.title,
                    description: controller.nextActivity.description,
                    date: controller.nextActivity.schedule[0].date,
                  );
                }),
                TextHeader(
                  title: 'Seu Calendário',
                  fontSize: MediaQuery.of(context).size.width < 500
                      ? 28
                      : MediaQuery.of(context).size.width < 1000
                          ? 30
                          : 38,
                  leftPadding:
                      MediaQuery.of(context).size.width < 1000 ? 12 : 8,
                ),
                UserWeekdayFilterWidget(
                  onPressed: controller.toggleFilterActivityChipIndex,
                ),
                Observer(builder: (_) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.weekActivitiesList.length,
                    itemBuilder: (context, index) {
                      var finalTime = controller
                                      .weekActivitiesList[index].duration ==
                                  null ||
                              controller.weekActivitiesList[index].date == null
                          ? ''
                          : Utils.getActivityFinalTime(
                              controller.weekActivitiesList[index].date!,
                              controller.weekActivitiesList[index].duration!);
                      var hour = DateFormat('HH:mm')
                          .format(controller.weekActivitiesList[index].date!);
                      return UserActivityCardWidget(
                        finalTime: finalTime,
                        location: controller.weekActivitiesList[index].location,
                        isOnline:
                            controller.weekActivitiesList[index].link == null
                                ? false
                                : true,
                        title: controller.weekActivitiesList[index].title,
                        hour: hour,
                        activityCode:
                            controller.weekActivitiesList[index].activityCode,
                        onTap: () {
                          var isRegistered = false;
                          var list = controller.subscribedActivitiesList
                              .where((element) =>
                                  element.id ==
                                  controller.weekActivitiesList[index].id)
                              .toList();
                          if (list.isNotEmpty) {
                            isRegistered = true;
                          }
                          Modular.to.navigate('/user/home/more-info',
                              arguments: [
                                controller.weekActivitiesList[index],
                                isRegistered
                              ]);
                          controller.analytics.logViewActivity(controller
                              .weekActivitiesList[index].activityCode);
                        },
                      );
                    },
                  );
                }),
              ],
            ),
          ));
        } else {
          return Scaffold(
              body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              UserDataWidget(
                logout: () {
                  navBarController.logout();
                },
                controller: controller,
              ),
              const SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextRenderer(
                  child: Text(
                    'Parece que você ainda não se inscreveu em nenhuma atividade :(',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.titleH1.copyWith(
                        color: AppColors.brandingOrange, fontSize: 32),
                  ),
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      await navBarController.toggleIndex(2);
                      Modular.to.navigate('/user/home/all-activities');
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(20),
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.brandingOrange),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'INSCREVA-SE',
                          style: AppTextStyles.button.copyWith(
                            fontSize: MediaQuery.of(context).size.width < 1630
                                ? 20
                                : 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ));
        }
      }
    });
  }
}
