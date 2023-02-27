import 'package:smile_front/app/modules/dashboard/infra/models/user_change_data_model.dart';

import '../repositories/user_repository_interface.dart';

abstract class ChangeDataInterface {
  Future<void> call(String nameToChange, String socialNameToChange,
      bool certificateWithSocialName, String phone);
}

class ChangeData implements ChangeDataInterface {
  final UserRepositoryInterface userRepository;

  ChangeData({required this.userRepository});

  @override
  Future<void> call(String nameToChange, String socialNameToChange,
      bool certificateWithSocialName, String phone) {
    final userData = UserChangeDataModel(
        phone: phone,
        name: nameToChange,
        socialName: socialNameToChange,
        certificateWithSocialName: certificateWithSocialName);

    return userRepository.changeData(userData);
  }
}
