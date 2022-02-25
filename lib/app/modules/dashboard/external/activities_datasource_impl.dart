import 'package:dio/dio.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

class ActivitiesDatasourceImpl extends ActivitiesDatasource {
  final Dio dioClient;

  ActivitiesDatasourceImpl(this.dioClient);

  @override
  Future<List<ActivityModel>> getActivities() async {
    try {
      final res = await dioClient.get('/smile_mss_activities/activity/getAll');
      if (res.statusCode == 200) {
        return ActivityModel.fromMaps(res.data);
      }
      throw Exception();
    } on Exception catch (e) {
      //Necessário um tratamento de erro visual para cada erro.
      // ignore: avoid_print
      print('Não foi possível se conectar com o Microsserviço, erro: ' +
          e.toString());
      rethrow;
    }
  }
}
