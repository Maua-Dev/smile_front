import 'package:dio/dio.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/activity_model.dart';

class ActivitiesDatasourceImpl extends ActivitiesDatasource {
  final Dio dioClient;

  ActivitiesDatasourceImpl(this.dioClient);

  @override
  Future<ActivityModel> getActivities() async {
    final res = await dioClient.get('/lecture');

    return ActivityModel.fromJson(res.data);
  }
}
