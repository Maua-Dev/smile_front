import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/home4_controller.dart';
import 'package:smile_front/app/shared/widgets/text_header_scratched.dart';

class Home4Page extends StatefulWidget {
  const Home4Page({Key? key}) : super(key: key);

  @override
  _Home4PageState createState() => _Home4PageState();
}

class _Home4PageState extends ModularState<Home4Page, Home4Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            const TextHeaderScratched(title: 'EDIÇÕES ANTERIORES'),
            Expanded(
              child: Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.all(48),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: controller.listLectureImages.length,
                    itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                      image: NetworkImage(
                          controller.listLectureImages[index].image),
                    ))),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
