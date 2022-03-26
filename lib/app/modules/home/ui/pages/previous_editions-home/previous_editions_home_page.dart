import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/previous_editions_home_controller.dart';
import 'package:smile_front/app/shared/widgets/text-header/text_header.dart';

import '../../../../../shared/widgets/text-header/text_header_scratched.dart';

class PreviousEditionsHomePage extends StatefulWidget {
  const PreviousEditionsHomePage({Key? key}) : super(key: key);

  @override
  _PreviousEditionsHomePageState createState() =>
      _PreviousEditionsHomePageState();
}

class _PreviousEditionsHomePageState extends ModularState<
    PreviousEditionsHomePage, PreviousEditionsHomeController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 48,
          ),
          const TextHeaderScratched(title: 'EDIÇÕES ANTERIORES'),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: Observer(builder: (_) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.3,
                      crossAxisCount: 4,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16),
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
