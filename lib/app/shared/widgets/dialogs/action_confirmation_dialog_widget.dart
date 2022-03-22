import 'package:flutter/material.dart';

class ActionConfirmationDialogWidget extends StatelessWidget {
  final Function()? onPressed;
  final bool isLoading;
  final String title;
  final String content;

  const ActionConfirmationDialogWidget(
      {Key? key,
      this.onPressed,
      required this.title,
      required this.content,
      required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: isLoading ? const CircularProgressIndicator() : Text(title),
      content: isLoading ? const CircularProgressIndicator() : Text(content),
      actions: [
        ElevatedButton(
          child: const Text('Fechar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text('Salvar'),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
