import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class ActionConfirmationDialogWidget extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final String? content;
  final bool isLoading;
  final bool? isDisable;

  const ActionConfirmationDialogWidget({
    Key? key,
    this.onPressed,
    required this.title,
    this.content,
    required this.isLoading,
    this.isDisable,
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
              : Text(S.of(context).confirmTitle),
        ),
      ],
    );
  }
}
