import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:smile_front/app/modules/register/ui/widgets/dialog/select_role_button_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/generated/l10n.dart';

import '../../../../../shared/domain/enum/user_roles_enum.dart';
import '../../../presenter/controllers/register_controller.dart';

class SelectRoleDialog extends StatelessWidget {
  const SelectRoleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<RegisterController>();
    return AlertDialog(
      title: Text(
        S.of(context).selectOptionTitle,
        style: AppTextStyles.headline3.copyWith(color: AppColors.white),
      ),
      backgroundColor: AppColors.backgroundLogin,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SelectRoleButtonWidget(
            title: UserRolesEnum.STUDENT.personalizedNamed,
            onPressed: () {
              controller.setRole(UserRolesEnum.STUDENT);
              Modular.to.pop();
            },
          ),
          SelectRoleButtonWidget(
            title: UserRolesEnum.PROFESSOR.personalizedNamed,
            onPressed: () {
              controller.setRole(UserRolesEnum.PROFESSOR);
              Modular.to.pop();
            },
          ),
          SelectRoleButtonWidget(
            title: UserRolesEnum.EXTERNAL.personalizedNamed,
            onPressed: () {
              controller.setRole(UserRolesEnum.EXTERNAL);
              Modular.to.pop();
            },
          ),
        ],
      ),
    );
  }
}
