import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class FaqCardWidget extends StatelessWidget {
  final String titulo;
  final String descricao;
  final bool isOpen;
  final Function()? onPressed;
  const FaqCardWidget(
      {Key? key,
      required this.titulo,
      required this.descricao,
      required this.isOpen,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ExpansionPanelList(
        animationDuration: const Duration(seconds: 1),
        elevation: 4,
        expandedHeaderPadding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        children: [
          ExpansionPanel(
              canTapOnHeader: true,
              isExpanded: isOpen,
              headerBuilder: (context, isExpanded) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          titulo,
                          style: AppTextStyles.titleH1.copyWith(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.width < 1000
                                  ? 22
                                  : 28),
                        ),
                      ),
                    ],
                  ),
              body: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(descricao,
                        style: AppTextStyles.titleH1.copyWith(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width < 1000
                                ? 16
                                : 24)),
                  ),
                ],
              )),
        ],
        expansionCallback: (i, isExpanded) {
          onPressed!();
        },
      ),
    );
  }
}
