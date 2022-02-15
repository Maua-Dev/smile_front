import 'dart:async';

import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/logged-adm-home/domain/entities/future_activity.dart';
import 'package:smile_front/app/shared/entities/user.dart';
import 'package:smile_front/app/modules/logged-adm-home/domain/repositories/future_activity_repository.dart';
import 'package:smile_front/app/modules/logged-adm-home/domain/repositories/logged_adm_repository.dart';

part 'logged_home_controller.g.dart';

class LoggedHomeController = _LoggedHomeControllerBase
    with _$LoggedHomeController;

abstract class _LoggedHomeControllerBase with Store {
  final LoggedAdmRepository loggedHomeRepository;
  final FutureActivityRepository futureActivityRepository;
  final timeNow = DateFormat.Hm();

  _LoggedHomeControllerBase(
      {required this.loggedHomeRepository,
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
    user = await loggedHomeRepository.getLoggedUser();
  }

  @action
  Future getActivity() async {
    activity = await futureActivityRepository.getFutureActivity();
  }
}
