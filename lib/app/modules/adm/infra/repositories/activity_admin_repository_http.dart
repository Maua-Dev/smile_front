import 'package:smile_front/app/modules/adm/domain/repositories/activity_admin_repository_interface.dart';
import 'package:smile_front/app/modules/adm/infra/datasource/activity_datasource_interface.dart';
import 'package:smile_front/app/modules/adm/infra/models/activity_admin_model.dart';

class ActivityAdminRepositoryHttp implements ActivityAdminRepositoryInterface {
  final ActivityDatasourceInterface datasource;

  ActivityAdminRepositoryHttp({required this.datasource});

  List<ActivityAdminModel> listAllAdminActivity = [];

  @override
  Future<List<ActivityAdminModel>> getAllAdminActivities() async {
    if (listAllAdminActivity.isNotEmpty) {
      var result = await datasource.getAdminActivities();
      listAllAdminActivity =
          result.map((e) => ActivityAdminModel.fromJson(e)).toList();
    }
    return listAllAdminActivity;
  }
}
