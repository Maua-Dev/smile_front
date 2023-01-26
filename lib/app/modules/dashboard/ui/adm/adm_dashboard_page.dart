import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/app_bar/adm_app_bar_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/activities_card/activities_column_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/filter/filter_card_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/side_bar/side_bar_widget.dart';
import '../../presenter/controllers/adm/adm_dashboard_controller.dart';

class AdmDashboardPage extends StatefulWidget {
  const AdmDashboardPage({Key? key}) : super(key: key);

  @override
  State<AdmDashboardPage> createState() => _AdmDashboardPageState();
}

class _AdmDashboardPageState
    extends ModularState<AdmDashboardPage, AdmDashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(73),
          child: AdmAppBarWidget(appBarText: 'Página do Administrador')),
      body: Row(
        children: [
          const SideBarWidget(),
          SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 80),
                    child: FilterCardWidget()),
                Observer(builder: (_) {
                  if (controller.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ActivitiesColumnWidget(
                      listAllActivities: controller.activitiesList,
                    );
                  }
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
