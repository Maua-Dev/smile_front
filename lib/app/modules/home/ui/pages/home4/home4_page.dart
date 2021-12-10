import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/home4_controller.dart';

class Home4Page extends StatefulWidget {
  const Home4Page({Key? key}) : super(key: key);

  @override
  _Home4PageState createState() => _Home4PageState();
}

class _Home4PageState extends ModularState<Home4Page, Home4Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: SizedBox(
          height: 500,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 2,
            ),
            itemCount: controller.listLectureImages.length,
            itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
              image: NetworkImage(controller.listLectureImages[index].image),
            ))),
          ),
        ),
      ),
    );
  }
}
