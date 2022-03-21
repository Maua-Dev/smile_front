import 'package:dio/native_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/modules/register/external/errors/errors.dart';
import 'package:smile_front/app/modules/register/external/register_datasource_impl.dart';
import 'package:smile_front/app/shared/entities/user_registration.dart';
import 'package:smile_front/app/shared/services/dio/smile_login_options.dart';

void main() {
  test('registerUser', () async {
    final ds =
        RegisterDatasourceImpl(dioClient: DioForNative(smileLoginOption));
    var res = '';
    try {
      res = await ds.registerUser(UserRegistration(
          name: 'Caio Toledo',
          email: 'caio@caio.com',
          cpfRne: '63480154085',
          password: 'Teste123!'));
    } catch (e) {
      res = 'erro';
    }
    expect(res.isNotEmpty, true);
  });
}
