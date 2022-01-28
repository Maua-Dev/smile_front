import 'package:flutter/material.dart';

class DashboardAppbarWidget extends StatelessWidget {
  const DashboardAppbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50.0, top: 30),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        const Icon(
          Icons.notifications,
          size: 40,
        ),
        const SizedBox(
          width: 10,
        ),
        const Icon(
          Icons.settings,
          size: 40,
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40), color: Colors.grey),
          height: 80,
          width: 80,
        ),
      ]),
    );
  }
}
