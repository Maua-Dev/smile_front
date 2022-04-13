import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
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
  _UserDashboardPageState createState() => _UserDashboardPageState();
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
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width < 1000 ? 12 : 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (controller.socialName == '' ||
                          controller.socialName == null)
                        Text(
                          'Olá, ${controller.name!.split(' ').first}',
                          style: AppTextStyles.titleH1.copyWith(
                              fontSize: MediaQuery.of(context).size.width < 500
                                  ? 35
                                  : MediaQuery.of(context).size.width < 1000
                                      ? 40
                                      : 45,
                              color: AppColors.brandingPurple),
                        )
                      else
                        Text(
                          'Olá, ${controller.socialName!.split(' ').first}',
                          style: AppTextStyles.titleH1.copyWith(
                              fontSize: MediaQuery.of(context).size.width < 500
                                  ? 35
                                  : MediaQuery.of(context).size.width < 1000
                                      ? 40
                                      : 45,
                              color: AppColors.brandingPurple),
                        ),
                      Row(
                        children: [
                          IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Column(
                                        children: [
                                          Center(
                                            child: Text(
                                              'Alteração de nome',
                                              style: AppTextStyles.titleH1
                                                  .copyWith(
                                                      fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width <
                                                              500
                                                          ? 35
                                                          : MediaQuery.of(context)
                                                                      .size
                                                                      .width <
                                                                  1000
                                                              ? 40
                                                              : 45,
                                                      color: AppColors
                                                          .brandingPurple),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 32),
                                            child: TextFormField(
                                              initialValue: controller.name,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              onChanged: controller.setName,
                                              style: AppTextStyles.body
                                                  .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 24),
                                              cursorColor: Colors.white,
                                              decoration: InputDecoration(
                                                fillColor:
                                                    AppColors.brandingPurple,
                                                prefixIcon: Icon(
                                                  Icons.abc,
                                                  color:
                                                      AppColors.brandingPurple,
                                                ),
                                                filled: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  borderSide: BorderSide(
                                                      color: AppColors
                                                          .brandingPurple,
                                                      width: 0.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  borderSide: BorderSide(
                                                      color: AppColors
                                                          .brandingPurple,
                                                      width: 0.0),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.edit,
                                color: AppColors.brandingPurple,
                                size: MediaQuery.of(context).size.width < 1000
                                    ? 30
                                    : 45,
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width < 1000
                                ? 8
                                : 32,
                          ),
                          IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                navBarController.logout();
                              },
                              icon: Icon(
                                Icons.logout,
                                color: AppColors.brandingPurple,
                                size: MediaQuery.of(context).size.width < 1000
                                    ? 30
                                    : 45,
                              )),
                        ],
                      ),
                    ],
                  ),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Parece que você ainda não se inscreveu em nenhuma atividade :(',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.titleH1
                      .copyWith(color: AppColors.brandingOrange, fontSize: 32),
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
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(20),
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.brandingOrange),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                      ),
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
