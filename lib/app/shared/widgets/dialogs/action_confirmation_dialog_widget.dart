import 'package:flutter/material.dart';

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
      title: Text(title),
      content: content != null ? Text(content!) : null,
      actions: [
        ElevatedButton(
          child: const Text('Fechar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
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
          onPressed: onPressed,
        ),
      ],
    );
  }
}
