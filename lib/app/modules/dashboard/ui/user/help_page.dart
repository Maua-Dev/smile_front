import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/help_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/faq/faq_card_widget.dart';

import '../../../../shared/entities/screen_variables.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/breakpoint.dart';
import '../../../../shared/widgets/text-header/text_header.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends ModularState<HelpPage, HelpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width < breakpointTablet
                ? MediaQuery.of(context).size.width
                : 1165,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (!window.location.href.contains('user'))
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Modular.to.navigate('/home');
                            },
                            icon: Icon(
                              Icons.arrow_back_sharp,
                              color: AppColors.brandingOrange,
                              size: MediaQuery.of(context).size.width <
                                      cellphoneSize
                                  ? 24
                                  : 40,
                            )),
                      if (!window.location.href.contains('user'))
                        const SizedBox(
                          width: 16,
                        ),
                      TextHeader(
                        title: 'Perguntas Frequentes',
                        fontSize:
                            MediaQuery.of(context).size.width < cellphoneSize
                                ? 20
                                : 30,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Observer(builder: (_) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.faq.length,
                      itemBuilder: (context, index) => FaqCardWidget(
                        titulo: controller.faq[index].question,
                        descricao: controller.faq[index].response,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
