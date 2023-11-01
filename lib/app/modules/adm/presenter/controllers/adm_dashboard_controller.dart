import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/adm/domain/entities/activity_admin.dart';
import 'package:smile_front/app/modules/adm/domain/usecases/get_admin_activities_usecase.dart';
import 'package:smile_front/app/modules/adm/presenter/states/adm_dashboard_state.dart';

part 'adm_dashboard_controller.g.dart';

class AdmDashboardController = AdmDashboardControllerBase
    with _$AdmDashboardController;

abstract class AdmDashboardControllerBase with Store {
  final GetAdminActivitiesUsecaseInterface _getAdminActivitiesUsecase;

  AdmDashboardControllerBase(this._getAdminActivitiesUsecase) {
    getAdminActivities();
  }

  @observable
  AdmDashboardState state = InitialAdmDashboardState();

  @action
  void setState(AdmDashboardState value) => state = value;

  @observable
  List<ActivityAdmin> activitiesAdminList = [];

  @action
  Future<void> getAdminActivities() async {
    setState(LoadingAdmDashboardState());
    var result = await _getAdminActivitiesUsecase();

    result.fold(
      (error) {
        //meu estado para uma exception
        setState(ErrorAdmDashboardState(message: error.message));
      },
      (listActivities) {
        // meu estado mostra a lista retornada
        activitiesAdminList = listActivities;
        setState(SuccessAdmDashboardState(listActivities: listActivities));
      },
    );
  }
}
