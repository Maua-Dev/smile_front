import '../models/user_change_data_model.dart';

abstract class UserDatasourceInterface {
  Future putUser(UserChangeDataModel userChangeDataModel);
}
