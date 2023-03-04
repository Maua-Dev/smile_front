import 'package:flutter/material.dart';

class AttendanceConfirmationWidget extends StatelessWidget {
  final String code;
  final void Function(String code) onChangeCode;
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final FocusNode _lastNode = FocusNode();

  AttendanceConfirmationWidget({
    Key? key,
    required this.code,
    required this.onChangeCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _controllers.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            width: 40,
            child: TextField(
              controller: _controllers[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              textInputAction: index == _controllers.length - 1
                  ? TextInputAction.done
                  : TextInputAction.next,
              focusNode: index == _controllers.length - 1 ? _lastNode : null,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  if (value.length >= 2) {
                    _controllers[index].text = value[0];
                  }
                  if (index < _controllers.length - 1) {
                    _controllers[index + 1].text = value[1];
                    FocusScope.of(context).nextFocus();
                  }
                  if (index == _controllers.length - 1) {
                    _controllers[index].selection = TextSelection.fromPosition(
                        TextPosition(offset: _controllers[index].text.length));
                  }
                } else if (value.isEmpty && index > 0) {
                  FocusScope.of(context).previousFocus();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
