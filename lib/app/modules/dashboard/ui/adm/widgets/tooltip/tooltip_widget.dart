import 'package:flutter/material.dart';

class TooltipWidget extends StatelessWidget {
  final String? message;
  const TooltipWidget({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      preferBelow: false,
      verticalOffset: 30,
      message: message,
      textStyle: const TextStyle(fontSize: 18, color: Colors.white),
      child: const Icon(Icons.question_mark_rounded),
    );
  }
}
