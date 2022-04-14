import '../../infra/models/user_change_data_model.dart';

abstract class UserRepositoryInterface {
  Future changeData(UserChangeDataModel userChangeDataModel);
}
