import 'dart:async';

import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/shared/entities/user.dart';
import 'package:smile_front/app/modules/logged-home/domain/repositories/future_activity_repository_interface.dart';

import '../../../../shared/entities/activity.dart';
import '../../../logged-home/domain/repositories/user_repository_interface.dart';

part 'logged_home_controller.g.dart';

class LoggedHomeController = _LoggedHomeControllerBase
    with _$LoggedHomeController;

abstract class _LoggedHomeControllerBase with Store {
  final UserRepositoryInterface userRepository;
  final FutureActivityRepositoryInterface futureActivityRepository;
  final timeNow = DateFormat.Hm();
  final String cpfRne;
  final String accessLevel;

  _LoggedHomeControllerBase(
      {required this.accessLevel,
      required this.cpfRne,
      required this.userRepository,
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
  Activity activity = Activity.newInstance();

  @action
  Future getTime() async {
    formatTime = timeNow.format(DateTime.now());
  }

  @action
  Future getUser() async {
    user = await userRepository.getUser(cpfRne);
  }

  @action
  Future getActivity() async {
    activity = await futureActivityRepository.getFutureActivity();
  }
}
