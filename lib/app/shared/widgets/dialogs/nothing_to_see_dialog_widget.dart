import 'package:flutter/material.dart';

class CustomAlertDialogWidget extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final String content;

  const CustomAlertDialogWidget({
    Key? key,
    this.onPressed,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
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
