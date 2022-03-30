import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(10.0),
      child: ExpansionPanelList(
        animationDuration: const Duration(seconds: 1),
        elevation: 4,
        expandedHeaderPadding: const EdgeInsets.all(8),
        children: [
          ExpansionPanel(
              canTapOnHeader: true,
              isExpanded: isOpen,
              headerBuilder: (context, isExpanded) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Text(
                          titulo,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
                child: Row(
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 14,
                      child: Text(
                        descricao,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
        expansionCallback: (i, isExpanded) {
          onPressed!();
        },
      ),
    );
  }
}
