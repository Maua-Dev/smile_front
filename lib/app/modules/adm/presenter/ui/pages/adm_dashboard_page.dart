import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/adm/domain/entities/activity_admin.dart';
import 'package:smile_front/app/modules/adm/presenter/controllers/adm_dashboard_controller.dart';
import 'package:smile_front/app/modules/adm/presenter/states/adm_dashboard_state.dart';
import 'package:smile_front/app/modules/adm/presenter/ui/widgets/adm_activity_card_widget.dart';
import 'package:smile_front/app/modules/adm/presenter/ui/widgets/adm_app_bar_widget.dart';
import 'package:smile_front/app/modules/adm/presenter/ui/widgets/adm_side_bar_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/filter/filter_card_widget.dart';
import 'package:smile_front/app/shared/helpers/services/snackbar/global_snackbar.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/generated/l10n.dart';

class AdmDashboardPage extends StatefulWidget {
  const AdmDashboardPage({Key? key}) : super(key: key);
  @override
  State<AdmDashboardPage> createState() => _AdmDashboardPageState();
}

class _AdmDashboardPageState
    extends ModularState<AdmDashboardPage, AdmDashboardController> {
  Widget _buildSuccess(List<ActivityAdmin> error) {
    return controller.activitiesAdminList.isNotEmpty
        ? Column(
            children: [
              //sugiro alterações no filtro
              const FilterCardWidget(),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.activitiesAdminList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Observer(builder: (_) {
                        return AdmActivityCardWidget(
                          activityAdmin: controller.activitiesAdminList[index],
                        );
                      }),
                    );
                  },
                ),
              ),
            ],
          )
        : Text(S.of(context).activitiesNotFound,
            style: AppTextStyles.headline1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(73),
          child: AdmAppBarWidget(
              appBarText: S.of(context).admDashboardAppBarTitle)),
      body: Row(
        children: [
          const AdmSideBarWidget(),
          Observer(builder: (_) {
            var state = controller.state;
            if (state is ErrorAdmDashboardState) {
              GlobalSnackBar.error(state.message);
            }
            if (state is SuccessAdmDashboardState) {
              return _buildSuccess(state.listActivities);
            }
            if (state is LoadingAdmDashboardState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
