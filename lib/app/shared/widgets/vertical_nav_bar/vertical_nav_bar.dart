import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
// import 'package:smile_front/app/shared/widgets/vertical_nav_bar/vertical_nav_bar_controller.dart';

class VerticalNavBar extends StatefulWidget {
  const VerticalNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<VerticalNavBar> createState() => _VerticalNavBarState();
}

class _VerticalNavBarState extends State<VerticalNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.brandingBlue,
      height: MediaQuery.of(context).size.height,
      width: 120,
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(children: [
          TextButton(
            onPressed: () {},
            child: Column(
              children: const [
                Icon(
                  Icons.apps_outlined,
                  color: Colors.white,
                  size: 55,
                ),
                Text(
                  'MENU',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {},
            child: Column(
              children: const [
                Icon(
                  Icons.mic,
                  color: Colors.white,
                  size: 55,
                ),
                Text(
                  'ATIVIDADES',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {},
            child: Column(
              children: const [
                Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 55,
                ),
                Text(
                  'USUÁRIOS',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {},
            child: Column(
              children: const [
                Icon(
                  Icons.assignment_turned_in,
                  color: Colors.white,
                  size: 55,
                ),
                Text(
                  'CERTIFICADOS',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {},
            child: Column(
              children: const [
                Icon(
                  Icons.insert_chart_rounded,
                  color: Colors.white,
                  size: 55,
                ),
                Text(
                  'RELATÓRIOS',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
