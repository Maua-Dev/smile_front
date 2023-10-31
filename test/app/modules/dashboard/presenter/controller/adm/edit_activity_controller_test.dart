import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/adm/adm_module.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/edit_activity.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_responsible_professors.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/edit_activity_controller.dart';
import 'package:smile_front/app/shared/domain/enum/user_roles_enum.dart';
import 'package:smile_front/app/shared/infra/models/admin_activity_model.dart';
import 'package:smile_front/app/shared/infra/models/responsible_professor_model.dart';
import 'package:smile_front/generated/l10n.dart';

import 'edit_activity_controller_test.mocks.dart';

@GenerateMocks([
  ActivitiesRepositoryInterface,
  EditActivityInterface,
  GetResponsibleProfessorsInterface,
])
void main() {
  initModules([AppModule(), AdmModule()]);

  initializeDateFormatting();
  List<ResponsibleProfessorModel> responsibleProfessors = [
    ResponsibleProfessorModel(
        id: '123124', name: 'Breno Amorim', role: UserRolesEnum.PROFESSOR)
  ];

  GetResponsibleProfessorsInterface getResponsibleProfessors =
      MockGetResponsibleProfessorsInterface();
  EditActivityInterface editActivity = MockEditActivityInterface();

  late EditActivityController controller;
  final activity = AdminActivityModel(
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
    enrollments: [],
  );

  setUpAll(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'pt'));
    await Modular.isModuleReady<AppModule>();
    when(getResponsibleProfessors())
        .thenAnswer((_) async => responsibleProfessors);
    controller = EditActivityController(
      editActivity: editActivity,
      activityModel: activity,
      getResponsibleProfessors: getResponsibleProfessors,
    );
  });

  test('setIsLoading', () {
    controller.setIsLoading(true);
    expect(controller.isLoading, true);
  });

  test('validateRequiredField', () async {
    var test = controller.validateRequiredField('');
    expect(test, 'Campo obrigatório');
  });

  test('setType', () {
    var str = ActivityEnum.ALUMNI_CAFE;
    controller.setType(str);
    expect(controller.activityToEdit.type, str);
  });

  test('setActivityCode', () {
    var str = '123';
    controller.setActivityCode(str);
    expect(controller.activityToEdit.activityCode, str);
  });

  test('setTitle', () {
    var str = 'teste';
    controller.setTitle(str);
    expect(controller.activityToEdit.title, str);
  });

  test('setDescription', () {
    var str = 'teste';
    controller.setDescription(str);
    expect(controller.activityToEdit.description, str);
  });

  test('setLocation', () {
    var str = 'teste';
    controller.setLocation(str);
    expect(controller.activityToEdit.place, str);
  });

  test('setLink', () {
    var str = 'teste';
    controller.setLink(str);
    expect(controller.activityToEdit.link, str);
  });

  test('setDate', () {
    var str = DateFormat('dd-MM-yyyy').format(DateTime.now());
    controller.setDate(str);
    expect(controller.activityToEdit.startDate!.day, DateTime.now().day);
  });

  test('setHour', () {
    var str = '22:00';
    controller.setHour(str);
    expect(controller.activityToEdit.startDate!.hour, 22);
  });

  test('setDuration', () {
    var str = '22';
    controller.setDuration(str);
    expect(controller.activityToEdit.duration, int.parse(str));
  });

  test('setParticipants', () {
    String str = '15';
    controller.setParticipants(str);
    expect(controller.activityToEdit.totalSlots, int.parse(str));
  });

  test('setEnableSubscription', () {
    controller.setEnableSubscription(true);
    expect(controller.activityToEdit.acceptingNewEnrollments, true);
  });

  test('setSpeakerName', () {
    var str = 'teste';
    controller.setSpeakerName(str, 0);
    expect(controller.activityToEdit.speakers[0].name, str);
  });

  test('setSpeakerBio', () {
    var str = 'teste';
    controller.setSpeakerBio(str, 0);
    expect(controller.activityToEdit.speakers[0].bio, str);
  });

  test('setSpeakerCompany', () {
    var str = 'teste';
    controller.setSpeakerCompany(str, 0);
    expect(controller.activityToEdit.speakers[0].company, str);
  });

  // test('removeSchedule', () {
  //   controller.removeSchedule(0);
  //   expect(controller.activityToEdit.schedule.length, 0);
  // });

  // test('addSchedule', () {
  //   controller.addSchedule();
  //   expect(controller.activityToEdit.schedule.length, 1);
  // });
}
