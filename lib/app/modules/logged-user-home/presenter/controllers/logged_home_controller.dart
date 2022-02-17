import 'dart:async';

import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/logged-adm-home/domain/entities/future_activity.dart';
import 'package:smile_front/app/modules/logged-user-home/infra/repository/user_repository_impl.dart';
import 'package:smile_front/app/shared/entities/user.dart';
import 'package:smile_front/app/shared/models/user_model.dart';

import '../../../logged-adm-home/domain/repositories/future_activity_repository.dart';

part 'logged_home_controller.g.dart';

class LoggedHomeController = _LoggedHomeControllerBase
    with _$LoggedHomeController;

abstract class _LoggedHomeControllerBase with Store {
  final UserRepositoryImpl loggedHomeRepository;
  final FutureActivityRepository futureActivityRepository;
  final String cpfRne;
  final timeNow = DateFormat.Hm();

  _LoggedHomeControllerBase({
    required this.futureActivityRepository,
    required this.cpfRne,
    required this.loggedHomeRepository,
  }) {
    getTime();
    getUser();
    getActivity();
  }

  @observable
  var formatTime = '';

  @observable
  FutureActivity activity = FutureActivity.newInstance();

  @observable
  var user = User.newInstance();

  @action
  Future getUser() async {
    user = await loggedHomeRepository.getUser(cpfRne);
  }

  @action
  Future getActivity() async {
    activity = await futureActivityRepository.getFutureActivity();
  }

  @action
  Future getTime() async {
    formatTime = timeNow.format(DateTime.now());
  }
}
