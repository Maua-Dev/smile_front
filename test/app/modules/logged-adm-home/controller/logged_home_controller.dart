import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/logged-adm-home/domain/repositories/future_activity_repository_interface.dart';
import 'package:smile_front/app/modules/logged-adm-home/domain/repositories/user_repository_interface.dart';
import 'package:smile_front/app/modules/logged-adm-home/presenter/controllers/logged_home_controller.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import 'package:smile_front/app/shared/models/user_model.dart';

import 'logged_home_controller.mocks.dart';

@GenerateMocks([UserRepositoryInteface, FutureActivityRepositoryInterface])
void main() {
  UserRepositoryInteface userRepository = MockUserRepositoryInteface();
  FutureActivityRepositoryInterface activityRepository =
      MockFutureActivityRepositoryInterface();
  late LoggedHomeController controller;
  final mockActivity = ActivityModel(
      id: '',
      enrolledUsers: [],
      name: 'ABCD123',
      description: '',
      date: DateTime.now(),
      type: ActivityEnum.CURSOS,
      createdAt: '',
      updateAt: '',
      workload: 0);

  final mockUser = UserModel(
      email: 'email',
      cpfRne: 'cpfRne',
      accessLevel: 'accessLevel',
      typeRole: 'typeRole',
      socialName: 'socialName');

  setUpAll(() {
    when(userRepository.getUser('')).thenAnswer((_) async => mockUser);
    when(activityRepository.getFutureActivity())
        .thenAnswer((_) async => mockActivity);
    controller = LoggedHomeController(
        cpfRne: '',
        futureActivityRepository: activityRepository,
        userRepository: userRepository);
  });

  test('getTime', () {
    controller.getTime();
    expect(controller.formatTime.isNotEmpty, true);
  });

  test('getUser', () {
    controller.getUser();
    expect(controller.user.email, 'email');
  });

  test('getActivity', () {
    controller.getActivity();
    expect(controller.activity.name, 'ABCD123');
  });
}
