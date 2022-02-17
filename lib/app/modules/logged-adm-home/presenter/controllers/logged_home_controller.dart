import 'dart:async';

import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/logged-adm-home/domain/entities/future_activity.dart';
import 'package:smile_front/app/shared/entities/user.dart';
import 'package:smile_front/app/modules/logged-adm-home/domain/repositories/future_activity_repository.dart';

import '../../../logged-user-home/domain/repositories/user_repository_interface.dart';

part 'logged_home_controller.g.dart';

class LoggedHomeController = _LoggedHomeControllerBase
    with _$LoggedHomeController;

abstract class _LoggedHomeControllerBase with Store {
  final UserRepositoryInteface loggedHomeRepository;
  final FutureActivityRepository futureActivityRepository;
  final timeNow = DateFormat.Hm();
  final String cpfRne;

  _LoggedHomeControllerBase(
      {required this.cpfRne,
      required this.loggedHomeRepository,
      required this.futureActivityRepository}) {
    getActivity();
    getUser();
    getTime();
  }

  @observable
  var formatTime = '';

  @observable
  User user = User.newInstance();

  @observable
  FutureActivity activity = FutureActivity.newInstance();

  @action
  Future getTime() async {
    formatTime = timeNow.format(DateTime.now());
  }

  @action
  Future getUser() async {
    user = await loggedHomeRepository.getUser(cpfRne);
  }

  @action
  Future getActivity() async {
    activity = await futureActivityRepository.getFutureActivity();
  }
}
