import 'package:flutter/material.dart';

class AddPhotoWidget extends StatelessWidget {
  final void Function()? onPressed;
  const AddPhotoWidget({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height * 0.15,
      height: MediaQuery.of(context).size.height * 0.15,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey,
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          icon: const Icon(
            Icons.add_a_photo,
            size: 34,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
