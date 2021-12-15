import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/home3_controller.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class Home3Page extends StatefulWidget {
  const Home3Page({Key? key}) : super(key: key);

  @override
  _Home3PageState createState() => _Home3PageState();
}

class _Home3PageState extends ModularState<Home3Page, Home3Controller> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightBlue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 150.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Container(
                            height: MediaQuery.of(context).size.height < 950
                                ? 350
                                : 400,
                            width: MediaQuery.of(context).size.height < 950
                                ? 350
                                : 400,
                            color: AppColors.brandingBlue,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height < 950
                              ? 350
                              : 400,
                          height: MediaQuery.of(context).size.height < 950
                              ? 350
                              : 400,
                          child: Observer(builder: (context) {
                            return Image.network(
                                controller.listRectors[0].image);
                          }),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Observer(builder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.listRectors[0].name,
                          style: AppTextStyles.titleH1.copyWith(fontSize: 50),
                        ),
                        Text(
                          controller.listRectors[0].role,
                          style: AppTextStyles.body
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(controller.listRectors[0].text),
                      ],
                    );
                  }),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Container(
                color: AppColors.brandingOrange,
                height: 8,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Observer(builder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.listRectors[1].name,
                          style: AppTextStyles.titleH1.copyWith(fontSize: 50),
                        ),
                        Text(
                          controller.listRectors[1].role,
                          style: AppTextStyles.body
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(controller.listRectors[1].text)
                      ],
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Container(
                            height: 400,
                            width: 400,
                            color: AppColors.brandingBlue,
                          ),
                        ),
                        SizedBox(
                          width: 400,
                          height: 400,
                          child: Observer(builder: (context) {
                            return Image.network(
                                controller.listRectors[1].image);
                          }),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
