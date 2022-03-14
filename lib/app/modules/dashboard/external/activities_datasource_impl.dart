import 'package:dio/dio.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

import '../utils/list_activities_mock.dart/activities_list_mock.dart';

class ActivitiesDatasourceImpl extends ActivitiesDatasource {
  final Dio dioClient;

  ActivitiesDatasourceImpl(this.dioClient);

  @override
  Future<List<ActivityModel>> getAllActivities() async {
    return Future.value(listActivitiesMock);
    // try {
    //   final res = await dioClient.get('/smile_mss_activities/activity/getAll');
    //   if (res.statusCode == 200) {
    //     return ActivityModel.fromMaps(res.data);
    //   }
    //   throw Exception();
    // } on Exception catch (e) {
    //   //Necessário um tratamento de erro visual para cada erro.
    //   // ignore: avoid_print
    //   print('Não foi possível se conectar com o Microsserviço, erro: ' +
    //       e.toString());
    //   rethrow;
    // }
  }

  @override
  Future putActivity(String id, ActivityModel activity) async {
    try {
      await dioClient.put('/smile_mss_activities/activity?id=$id',
          data: activity.toJson());
    } on Exception catch (e) {
      //Necessário um tratamento de erro visual para cada erro.
      // ignore: avoid_print
      print('Não foi possível se conectar com o Microsserviço, erro: ' +
          e.toString());
    }
  }

  @override
  Future postActivity(String id, ActivityModel activity) async {
    try {
      await dioClient.post('/smile_mss_activities/activity',
          data: activity.toJson());
    } on Exception catch (e) {
      //Necessário um tratamento de erro visual para cada erro.
      // ignore: avoid_print
      print('Não foi possível se conectar com o Microsserviço, erro: ' +
          e.toString());
    }
  }

  @override
  Future removeActivity(String id) async {
    try {
      await dioClient.delete('/smile_mss_activities/activity?id=$id');
    } on Exception catch (e) {
      //Necessário um tratamento de erro visual para cada erro.
      // ignore: avoid_print
      print('Não foi possível se conectar com o Microsserviço, erro: ' +
          e.toString());
    }
  }
}
