import 'package:flutter/material.dart';
import 'package:smile_front/generated/l10n.dart';

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
          child: Text(S.of(context).closeTitle),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
