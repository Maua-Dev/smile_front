import 'package:smile_front/app/modules/adm/infra/datasource/activity_datasource_interface.dart';
import 'package:smile_front/app/shared/helpers/services/http/http_request_interface.dart';

class AdminActivitiesDatasource implements ActivityDatasourceInterface {
  final IHttpRequest _httpRequest;

  AdminActivitiesDatasource(this._httpRequest);

  @override
  Future<List<Map<String, dynamic>>> getAdminActivities() async {
    var result = await _httpRequest.get('');

    if (result.statusCode == 200) {
      return result.data;
    }

    throw Exception();
  }
}
