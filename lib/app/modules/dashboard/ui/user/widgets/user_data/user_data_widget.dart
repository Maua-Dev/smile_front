import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/generated/l10n.dart';

import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../shared/widgets/dialogs/action_confirmation_dialog_widget.dart';
import '../../../../../../shared/widgets/dialogs/custom_alert_dialog_widget.dart';
import '../../../../presenter/controllers/user/user_dashboard_controller.dart';
import 'name_alteration_dialog.dart';

class UserDataWidget extends StatelessWidget {
  final Function()? logout;
  final Color? mainColor;

  const UserDataWidget({
    Key? key,
    this.logout,
    this.mainColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<UserDashboardController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (controller.socialName == '' || controller.socialName == null)
          Text(
            S.of(context).helloTitle(controller.name!.split(' ').first),
            style: AppTextStyles.titleH1.copyWith(
                fontSize: MediaQuery.of(context).size.width < 500
                    ? 35
                    : MediaQuery.of(context).size.width < 1000
                        ? 40
                        : 45,
                color: mainColor ?? AppColors.brandingBlue),
          )
        else
          Text(
            'Olá, ${controller.socialName!.split(' ').first}',
            style: AppTextStyles.titleH1.copyWith(
                fontSize: MediaQuery.of(context).size.width < 500
                    ? 35
                    : MediaQuery.of(context).size.width < 1000
                        ? 40
                        : 45,
                color: mainColor ?? AppColors.brandingBlue),
          ),
        Row(
          children: [
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  controller.getCertificateWithSocialName();
                  controller.getUserName();
                  controller.getUserSocialName();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Observer(builder: (_) {
                        return NameAlterationDialog(
                            name: controller.nameToChange,
                            onChangedName: controller.setName,
                            socialName: controller.socialNameToChange,
                            onChangedSocialName: controller.setUserSocialName,
                            onChangedWantSocialName:
                                controller.setWantSocialName,
                            wantSocialName: controller.wantSocialName,
                            certificateWithSocialName:
                                controller.certificateWithSocialName,
                            onChangedCertificateWithSocialName:
                                controller.setCertificateWithSocialName,
                            isLoading: controller.isLoading,
                            changeData: () {
                              if (controller.wantSocialName) {
                                if (controller.validateName() &&
                                    controller.validateSocialName()) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Observer(builder: (context) {
                                        return ActionConfirmationDialogWidget(
                                            isLoading: controller.isLoading,
                                            title:
                                                'Tem certeza que deseja continuar?',
                                            content:
                                                'Se atente! A alteração afetará diretamente a sua certificação.',
                                            onPressed: () {
                                              controller.changeUserData();
                                              Navigator.of(context).pop();
                                              Navigator.of(context).pop();
                                            });
                                      });
                                    },
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CustomAlertDialogWidget(
                                        title: controller.error!,
                                      );
                                    },
                                  );
                                }
                              } else {
                                if (controller.validateName()) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ActionConfirmationDialogWidget(
                                          isLoading: controller.isLoading,
                                          title:
                                              'Tem certeza que deseja continuar?',
                                          content:
                                              'Se atente! A alteração afetará diretamente a sua certificação.',
                                          onPressed: () {
                                            controller.changeUserData();
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                          });
                                    },
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CustomAlertDialogWidget(
                                        title: controller.error!,
                                      );
                                    },
                                  );
                                }
                              }
                            });
                      });
                    },
                  );
                },
                icon: Icon(
                  Icons.edit,
                  color: mainColor ?? AppColors.brandingBlue,
                  size: MediaQuery.of(context).size.width < 1000 ? 30 : 45,
                )),
            SizedBox(
              width: MediaQuery.of(context).size.width < 1000 ? 8 : 32,
            ),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: logout,
                icon: Icon(
                  Icons.logout,
                  color: mainColor ?? AppColors.brandingBlue,
                  size: MediaQuery.of(context).size.width < 1000 ? 30 : 45,
                )),
          ],
        ),
      ],
    );
  }
}
