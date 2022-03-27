import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/all_activities_user_dashboard_controller.dart';
import '../../../../shared/widgets/text-header/text_header.dart';
import '../widgets/dropdown-field/dropdown_field_widget.dart';
import '../widgets/user_weekday/user_weekday_filter_widget.dart';

class AllActivitiesUserDashboardPage extends StatefulWidget {
  const AllActivitiesUserDashboardPage({Key? key}) : super(key: key);

  @override
  State<AllActivitiesUserDashboardPage> createState() =>
      _AllActivitiesUserDashboardPageState();
}

class _AllActivitiesUserDashboardPageState extends ModularState<
    AllActivitiesUserDashboardPage, AllActivitiesUserDashboardController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          TextHeader(
            title: 'Todas as Atividades',
            fontSize: MediaQuery.of(context).size.width < 1000 ? 30 : 38,
            leftPadding: MediaQuery.of(context).size.width < 1000 ? 12 : 24,
          ),
          UserWeekdayFilterWidget(
            onPressed: controller.toggleFilterActivityChipIndex,
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropDownFieldWidget<ActivityEnum>(
              titulo: 'Tipo',
              items: ActivityEnum.values.map((ActivityEnum value) {
                return DropdownMenuItem<ActivityEnum>(
                  value: value,
                  child: Text(value.name),
                );
              }).toList(),
              onChanged: controller.getActivitiesByType,
              value: controller.activityType,
            ),
          ),
        ],
      ),
    );
  }
}
