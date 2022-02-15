import 'package:dio/native_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/modules/dashboard/external/activities_datasource_impl.dart';
import 'package:smile_front/app/shared/services/dio/smile_options.dart';

void main() {
  test('Teste', () async {
    final ds = ActivitiesDatasourceImpl(DioForNative(smileOption));
    final res = await ds.getActivities();
    print(res.name);
  });
}
