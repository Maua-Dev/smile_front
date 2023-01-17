import 'package:smile_front/app/modules/dashboard/infra/models/user_change_data_model.dart';

import '../repositories/user_repository_interface.dart';

abstract class ChangeDataInterface {
  Future call(String nameToChange, String socialNameToChange,
      bool certificateWithSocialName);
}

class ChangeData implements ChangeDataInterface {
  final UserRepositoryInterface userRepository;

  ChangeData({required this.userRepository});

  @override
  Future call(String nameToChange, String socialNameToChange,
      bool certificateWithSocialName) {
    final userData = UserChangeDataModel(
        name: nameToChange,
        socialName: socialNameToChange,
        certificateWithSocialName: certificateWithSocialName);

    return userRepository.changeData(userData);
  }
}
