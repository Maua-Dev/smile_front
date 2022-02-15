import 'package:dio/native_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/modules/logged-user-home/external/logged_user_datasource_impl.dart';
import 'package:smile_front/app/shared/services/dio/smile_options.dart';

void main() {
  test('teste', () async {
    final ds = LoggedUserDatasourceImpl(DioForNative(smileOption));
    final res = await ds.getLoggedUser();
    expect(res.socialName, "r10");
  });
}
