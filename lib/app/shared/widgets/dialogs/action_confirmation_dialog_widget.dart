import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_web.dart';

class ActionConfirmationDialogWidget extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final String? content;
  final bool isLoading;

  const ActionConfirmationDialogWidget({
    Key? key,
    this.onPressed,
    required this.title,
    this.content,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TextRenderer(child: Text(title)),
      content: content != null ? Text(content!) : null,
      actions: [
        ElevatedButton(
          child: const TextRenderer(child: Text('Fechar')),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          onPressed: onPressed,
          child: isLoading
              ? const SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1,
                  ),
                )
              : const Text('Confirmar'),
        ),
      ],
    );
  }
}
