import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smile_front/app/modules/adm/domain/repositories/activity_admin_repository_interface.dart';
import 'package:smile_front/app/modules/adm/infra/datasource/activity_datasource_interface.dart';
import 'package:smile_front/app/modules/adm/infra/models/activity_admin_model.dart';
import 'package:smile_front/app/shared/helpers/enums/http_status_code_enum.dart';
import 'package:smile_front/app/shared/helpers/errors/errors.dart';
import 'package:smile_front/app/shared/helpers/functions/get_http_status_function.dart';

class ActivityAdminRepositoryHttp implements ActivityAdminRepositoryInterface {
  final ActivityDatasourceInterface datasource;

  ActivityAdminRepositoryHttp(this.datasource);

  List<ActivityAdminModel> listAllAdminActivity = [];

  @override
  Future<Either<Failure, List<ActivityAdminModel>>>
      getAllAdminActivities() async {
    try {
      if (listAllAdminActivity.isEmpty) {
        var result = await datasource.getAdminActivities();
        listAllAdminActivity =
            result.map((e) => ActivityAdminModel.fromJson(e)).toList();
      }
      return right(listAllAdminActivity);
    } on DioException catch (e) {
      HttpStatusCodeEnum errorType = getHttpStatusFunction(
          e.response?.statusCode ?? HttpStatus.badRequest);
      return left(ErrorRequest(message: errorType.errorMessage));
    }
  }
}
