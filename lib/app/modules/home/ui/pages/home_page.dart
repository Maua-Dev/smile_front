import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/home/ui/pages/home1/home1_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/home3/home3_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/home4/home4_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        children: const [Home1Page(), Home3Page(), Home4Page()],
      ),
    );
  }
}
