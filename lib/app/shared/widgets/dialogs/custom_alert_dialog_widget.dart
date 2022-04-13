import 'package:flutter/material.dart';

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
      title: Text(title),
      content: content != null ? Text(content!) : null,
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
