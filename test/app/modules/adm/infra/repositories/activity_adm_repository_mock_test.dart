import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/modules/adm/infra/repositories/activity_admin_repository_mock.dart';

void main() {
  var repo = ActivityAdminRepositoryMock();
  test('[TEST] - getAllAdminActivities', () async {
    var result = await repo.getAllAdminActivities();
    expect(result, isA<Right>());
  });
}
