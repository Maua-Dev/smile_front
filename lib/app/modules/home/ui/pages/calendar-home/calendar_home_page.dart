import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/calendar_home_controller.dart';
import 'package:smile_front/app/shared/widgets/text_header_scratched.dart';

class CalendarHomePage extends StatefulWidget {
  const CalendarHomePage({Key? key}) : super(key: key);

  @override
  _CalendarHomePageState createState() => _CalendarHomePageState();
}

class _CalendarHomePageState
    extends ModularState<CalendarHomePage, CalendarHomeController> {
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
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio:
                        MediaQuery.of(context).size.width < 1600 ? 2 : 1.3,
                    crossAxisCount:
                        MediaQuery.of(context).size.width < 1600 ? 3 : 4,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemCount: controller.listLectureImages.length,
                itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                  image:
                      NetworkImage(controller.listLectureImages[index].image),
                ))),
              );
            }),
          ),
        ],
      ),
    );
  }
}
