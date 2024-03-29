import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/certificate_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/change_data.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/delete_user.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/generate_confirmation_code.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_activities_with_enrollments.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_all_activities.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_user_certificates.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/post_manual_change_attendance.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/send_confirm_attendance.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/unsubscribe_activities.dart';
import 'package:smile_front/app/modules/dashboard/external/activities_datasource_impl.dart';
import 'package:smile_front/app/modules/dashboard/external/certificate_datasource_impl.dart';
import 'package:smile_front/app/modules/dashboard/faq_module.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/certificate_datasource_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/repository/certificates_repository_impl.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/all_activities_user_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/certificate_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/more_info_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_subscription_controller.dart';
import 'package:smile_front/app/modules/dashboard/professor_module.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/all_activities_user_dashboard_page.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/certificate_page.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/more_info_page.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/user_dashboard_page.dart';
import '../auth/domain/repositories/secure_storage_interface.dart';
import '../auth/infra/auth_guards/auth_guard_professor.dart';
import '../auth/presenter/controllers/auth_controller.dart';
import '../auth/domain/usecases/login_with_email.dart';
import '../auth/domain/usecases/refresh_token.dart';
import 'domain/repositories/user_repository_interface.dart';
import 'domain/usecases/get_user_subscribed_activities.dart';
import 'domain/usecases/subscribe_activities.dart';
import 'external/user_datasource_impl.dart';
import 'infra/datasources/user_datasource_interface.dart';
import 'infra/repository/activities_repository_impl.dart';
import 'infra/repository/user_repository_impl.dart';

class UserModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AllActivitiesUserDashboardController>(
        (i) => AllActivitiesUserDashboardController(
              authController: i(),
              enrollmentController: i(),
            ),
        export: true),
    Bind.lazySingleton<UserEnrollmentController>(
        (i) => UserEnrollmentController(
              getUserActivities: i(),
              subscribeActivity: i(),
              unsubscribeActivity: i(),
            ),
        export: true),
    Bind.lazySingleton<ActivitiesDatasourceInterface>(
        (i) => ActivitiesDatasourceImpl(
              storage: i<SecureStorageInterface>(),
            )),
    Bind.lazySingleton<GenerateConfirmationCodeInterface>(
        (i) => GenerateConfirmationCodeImpl(repository: i())),
    Bind.lazySingleton<GetActivitiesWithEnrollmentsInterface>(
        (i) => GetActivitiesWithEnrollmentsImp(repository: i())),
    Bind.lazySingleton<GetAllUserActivitiesInterface>((i) => GetActivitiesList(
          repository: i(),
        )),
    Bind.lazySingleton<UserDatasourceInterface>((i) => UserDatasourceImpl(
          storage: i<SecureStorageInterface>(),
        )),
    Bind.lazySingleton<ActivitiesRepositoryInterface>(
        (i) => ActivitiesRepositoryImpl(datasource: i())),
    Bind.lazySingleton<GetUserSubscribedActivitiesInterface>(
        (i) => GetUserSubscribedActivitiesImp(repository: i())),
    Bind.lazySingleton<UnsubscribeActivityInterface>(
        (i) => UnsubscribeActivity(repository: i())),
    Bind.lazySingleton<SubscribeActivityInterface>(
        (i) => SubscribeActivity(repository: i())),
    Bind.lazySingleton<PostManualChangeAttendenceInterface>(
        (i) => PostManualChangeAttendence(repository: i())),
    Bind.lazySingleton<UserRepositoryInterface>(
        (i) => UserRepositoryImpl(datasource: i())),
    Bind.lazySingleton<ChangeDataInterface>(
        (i) => ChangeData(userRepository: i())),
    Bind.lazySingleton<DeleteUserInterface>(
        (i) => DeleteUser(activitiesRepository: i())),
    Bind.lazySingleton<UserDashboardController>(
      (i) => UserDashboardController(
        deleteUser: i(),
        secureStorage: i(),
        changeData: i(),
        enrollmentController: i(),
      ),
    ),
    Bind.lazySingleton((i) => Dio()),
    Bind.lazySingleton<AuthController>(
        (i) => AuthController(
              loginWithEmail: i<LoginWithEmailInterface>(),
              refreshToken: i<RefreshTokenInterface>(),
              storage: i<SecureStorageInterface>(),
            ),
        export: true),
    Bind.lazySingleton<MoreInfoController>(
        (i) => MoreInfoController(
              sendConfirmAttendanceUsecase: i(),
              enrollmentController: i(),
              activityCode: i.args?.data as String? ?? '',
              storage: i(),
            ),
        export: true),
    Bind.lazySingleton<CertificateRepositoryInterface>(
        (i) => CertificateRepositoryImpl(datasource: i())),
    Bind.lazySingleton<CertificateDatasourceInterface>(
        (i) => CertificateDatasourceImpl(storage: i())),
    Bind.lazySingleton<CertificateController>(
        (i) => CertificateController(getUserCertificates: i())),
    Bind.lazySingleton<GetUserCertificatesInterface>(
        (i) => GetUserCertificates(repository: i())),
    Bind.lazySingleton<SendConfirmAttendance>(
        (i) => SendConfirmAttendance(repository: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const UserDashboardPage(),
        transition:
            kIsWeb ? TransitionType.fadeIn : TransitionType.rightToLeft),
    ChildRoute('/all-activities',
        child: (_, args) => const AllActivitiesUserDashboardPage(),
        transition:
            kIsWeb ? TransitionType.fadeIn : TransitionType.rightToLeft),
    ChildRoute(
      '/more-info',
      child: (_, args) => const MoreInfoPage(),
    ),
    ChildRoute(
      '/certificate',
      child: (_, args) => const CertificatePage(),
      transition: kIsWeb ? TransitionType.fadeIn : TransitionType.rightToLeft,
    ),
    ModuleRoute(
      '/help',
      module: FaqModule(),
      transition: TransitionType.rightToLeft,
    ),
    ModuleRoute('/professor',
        module: ProfessorModule(), guards: [AuthGuardProfessor()])
  ];
}
