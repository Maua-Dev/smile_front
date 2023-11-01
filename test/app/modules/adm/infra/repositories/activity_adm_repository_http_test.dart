import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/adm/infra/datasource/activity_datasource_interface.dart';
import 'package:smile_front/app/modules/adm/infra/repositories/activity_admin_repository_http.dart';
import 'package:smile_front/generated/l10n.dart';

import 'activity_adm_repository_http_test.mocks.dart';

@GenerateMocks([
  ActivityDatasourceInterface,
])
void main() {
  ActivityDatasourceInterface datasource = MockActivityDatasourceInterface();

  late ActivityAdminRepositoryHttp repo;

  setUpAll(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
    repo = ActivityAdminRepositoryHttp(datasource);
  });

  group('[TEST] - ActivityAdminRepositoryHttp getAllAdminActivities', () {
    test('Success', () async {
      when(datasource.getAdminActivities())
          .thenAnswer((realInvocation) async => []);
      var result = await repo.getAllAdminActivities();
      expect(result, isA<Right>());
    });

    test('Error', () async {
      when(datasource.getAdminActivities())
          .thenThrow(DioException(requestOptions: RequestOptions()));
      var result = await repo.getAllAdminActivities();
      expect(result, isA<Left>());
    });
  });
}
