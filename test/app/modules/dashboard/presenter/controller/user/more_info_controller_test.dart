import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/send_confirm_attendance.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/more_info_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_subscription_controller.dart';
import 'package:smile_front/app/shared/models/enrolls_activity_model.dart';

import '../../../../../../setup_firebase_mocks.dart';
import 'more_info_controller_test.mocks.dart';

@GenerateMocks([UserEnrollmentController, ConfirmAttendanceUsecase])
void main() {
  initModule(AppModule());
  setupCloudFirestoreMocks();

  late MoreInfoController controller;
  UserEnrollmentController enrollmentController =
      MockUserEnrollmentController();
  ConfirmAttendanceUsecase confirmAttendanceUsecase =
      MockConfirmAttendanceUsecase();
  EnrollsActivityModel activity = EnrollsActivityModel(
    activityCode: 'C01',
    type: ActivityEnum.COURSES,
    title:
        'Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01',
    description:
        'Teste de atividade mock Teste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mock',
    speakers: [
      SpeakerActivityModel(
        name: 'Gabriel Godoy',
        bio: 'Caros participantes, este é um teste, aproveitem a atividade',
        company: 'Oracle',
      ),
      SpeakerActivityModel(
        name: 'Gabriel Godoy',
        bio: 'Caros participantes, este é um teste, aproveitem a atividade',
        company: 'Oracle',
      ),
      SpeakerActivityModel(
        name: 'Gabriel Godoy',
        bio: 'Caros participantes, este é um teste, aproveitem a atividade',
        company: 'Oracle',
      ),
    ],
    startDate: DateTime.parse('2022-05-16 13:00'),
    totalSlots: 20,
    duration: 120,
    place: 'H244',
    link: 'https://www.google.com.br',
    acceptingNewEnrollments: false,
    isExtensive: false,
    takenSlots: 0,
    responsibleProfessors: [],
  );

  setUpAll(() async {
    await Firebase.initializeApp();

    controller = MoreInfoController(
      sendConfirmAttendanceUsecase: confirmAttendanceUsecase,
      enrollmentController: enrollmentController,
      activityCode: activity.activityCode,
    );
  });

  test('setIsLoading', () {
    controller.setIsLoading(true);
    expect(controller.isLoading, true);
  });
}
