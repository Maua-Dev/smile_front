import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/help_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/faq/faq_card_widget.dart';

import '../../../../shared/widgets/text-header/text_header.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final controller = Modular.get<HelpController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            TextHeader(
              title: 'Perguntas Frequentes',
              fontSize: MediaQuery.of(context).size.width < 1000 ? 30 : 38,
              leftPadding: 12,
            ),
            const SizedBox(
              height: 16,
            ),
            Observer(builder: (_) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.faqAction.length,
                itemBuilder: (context, index) => FaqCardWidget(
                  titulo: controller.faqAction[index].faq.question,
                  descricao: controller.faqAction[index].faq.response,
                  isOpen: controller.faqAction[index].isOpen,
                  onPressed: () {
                    controller.swapOpen(index);
                  },
                  analyticsLogPress: () {
                    controller.analytics
                        .logFaq(controller.faqAction[index].faq.id);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
