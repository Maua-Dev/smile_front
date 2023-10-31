import 'package:smile_front/app/modules/adm/domain/entities/activity_admin.dart';

abstract class AdmDashboardState {}

class InitialAdmDashboardState implements AdmDashboardState {}

class LoadingAdmDashboardState implements AdmDashboardState {}

class SuccessAdmDashboardState implements AdmDashboardState {
  final List<ActivityAdmin> listActivities;

  SuccessAdmDashboardState({required this.listActivities});
}

class ErrorAdmDashboardState implements AdmDashboardState {
  final String message;

  ErrorAdmDashboardState({required this.message});
}
