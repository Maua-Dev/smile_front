import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/logged-home/domain/entities/future_activity.dart';
import 'package:smile_front/app/modules/logged-home/domain/entities/logged_user.dart';
import 'package:smile_front/app/modules/logged-home/domain/repositories/future_activity_repository.dart';
import 'package:smile_front/app/modules/logged-home/domain/repositories/logged_user_repository.dart';

part 'logged_home_controller.g.dart';

class LoggedHomeController = _LoggedHomeControllerBase
    with _$LoggedHomeController;

abstract class _LoggedHomeControllerBase with Store {
  final LoggedUserRepository loggedHomeRepository;
  final FutureActivityRepository futureActivityRepository;

  _LoggedHomeControllerBase(
      {required this.loggedHomeRepository,
      required this.futureActivityRepository}) {
    getActivity();
    getUser();
  }

  @observable
  LoggedUser user = LoggedUser.newInstance();

  @observable
  FutureActivity activity = FutureActivity.newInstance();

  @action
  Future getUser() async {
    user = await loggedHomeRepository.getLoggedUser();
  }

  @action
  Future getActivity() async {
    activity = await futureActivityRepository.getFutureActivity();
  }
}
