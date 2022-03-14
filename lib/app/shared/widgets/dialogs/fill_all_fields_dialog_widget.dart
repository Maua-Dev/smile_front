import 'package:flutter/material.dart';

class FillAllFieldsDialogWidget extends StatelessWidget {
  const FillAllFieldsDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Preencha todos os campos!'),
      content: const Text(
          'Confira se todos os campos estão corretamente preenchidos.'),
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
