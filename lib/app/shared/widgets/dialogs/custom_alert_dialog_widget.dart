import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_web.dart';

class CustomAlertDialogWidget extends StatelessWidget {
  final String title;
  final String? content;

  const CustomAlertDialogWidget({
    Key? key,
    required this.title,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TextRenderer(child: Text(title)),
      content: content != null ? TextRenderer(child: Text(content!)) : null,
      actions: [
        ElevatedButton(
          child: const Text('Fechar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
