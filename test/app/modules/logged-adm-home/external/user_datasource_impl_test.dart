import 'package:dio/native_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/modules/logged-adm-home/external/user_datasource_impl.dart';
import 'package:smile_front/app/shared/services/dio/smile_options.dart';

void main() {
  test('getActivities', () async {
    final ds = UserDatasourceImpl(DioForNative(smileOption));
    final res = await ds.getLoggedUser('');
    expect(res.email.isNotEmpty, true);
  });
}
