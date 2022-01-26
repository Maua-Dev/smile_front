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

double imageSize(size) {
  if (size < 1600 && size >= 1440) {
    return 200;
  }
  if (size < 1440 && size >= 1280) {
    return 200;
  }
  if (size < 1280 && size >= 960) {
    return 200;
  }
  return 200;
}

double imagePadding(size) {
  if (size < 1600 && size >= 1440) {
    return 200;
  }
  if (size < 1440 && size >= 1280) {
    return 150;
  }
  if (size < 1280 && size >= 960) {
    return 100;
  }
  return 100;
}

class _Home4PageState extends ModularState<Home4Page, Home4Controller> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          const TextHeaderScratched(title: 'EDIÇÕES ANTERIORES'),
          Expanded(
            child: Observer(builder: (_) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 48, horizontal: imagePadding(size)),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: imageSize(size),
                      crossAxisCount: 4,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 32),
                  itemCount: controller.listLectureImages.length,
                  itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                    image:
                        NetworkImage(controller.listLectureImages[index].image),
                  ))),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
