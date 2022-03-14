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

int crossAxisCount(size, height) {
  if (size <= 1920 && size >= 1760) {
    if (height <= 1080 && height >= 990) return 3;
    if (height <= 990 && height >= 900) return 3;
    if (height <= 900 && height >= 810) return 4;
    if (height <= 810 && height >= 720) return 4;
    if (height <= 720 && height >= 630) return 4;
    return 4;
  }
  if (size <= 1760 && size >= 1600) {
    if (height <= 1080 && height >= 990) return 3;
    if (height <= 990 && height >= 900) return 3;
    if (height <= 900 && height >= 810) return 4;
    if (height <= 810 && height >= 720) return 4;
    if (height <= 720 && height >= 630) return 4;
    return 4;
  }
  if (size <= 1600 && size >= 1440) {
    if (height <= 1080 && height >= 990) return 3;
    if (height <= 990 && height >= 900) return 3;
    if (height <= 900 && height >= 810) return 4;
    if (height <= 810 && height >= 720) return 4;
    if (height <= 720 && height >= 630) return 4;
    return 4;
  }
  if (size <= 1440 && size >= 1280) {
    if (height <= 1080 && height >= 990) return 3;
    if (height <= 990 && height >= 900) return 3;
    if (height <= 900 && height >= 810) return 4;
    if (height <= 810 && height >= 720) return 4;
    if (height <= 720 && height >= 630) return 4;
    return 4;
  }
  if (size <= 1280 && size >= 1120) {
    if (height <= 1080 && height >= 990) return 3;
    if (height <= 990 && height >= 900) return 3;
    if (height <= 900 && height >= 810) return 4;
    if (height <= 810 && height >= 720) return 4;
    if (height <= 720 && height >= 630) return 4;
    return 4;
  }
  if (size <= 1280 && size >= 1120) {
    if (height <= 1080 && height >= 990) return 3;
    if (height <= 990 && height >= 900) return 3;
    if (height <= 900 && height >= 810) return 4;
    if (height <= 810 && height >= 720) return 4;
    if (height <= 720 && height >= 630) return 4;
    return 4;
  }
  if (size <= 1120 && size >= 960) {
    if (height <= 1080 && height >= 990) return 3;
    if (height <= 990 && height >= 900) return 3;
    if (height <= 900 && height >= 810) return 4;
    if (height <= 810 && height >= 720) return 4;
    if (height <= 720 && height >= 630) return 4;
    return 4;
  }
  return 4;
}

double imageSize(size, height) {
  if (size < 1920 && size >= 1760) {
    if (height <= 1080 && height >= 990) return 220;
    if (height <= 990 && height >= 900) return 190;
    if (height <= 900 && height >= 810) return 250;
    if (height <= 810 && height >= 720) return 210;
    if (height <= 720 && height >= 630) return 160;
    return 200;
  }
  if (size < 1760 && size >= 1600) {
    if (height <= 1080 && height >= 990) return 220;
    if (height <= 990 && height >= 900) return 190;
    if (height <= 900 && height >= 810) return 250;
    if (height <= 810 && height >= 720) return 210;
    if (height <= 720 && height >= 630) return 160;
    return 200;
  }
  if (size < 1600 && size >= 1440) {
    if (height <= 1080 && height >= 990) return 220;
    if (height <= 990 && height >= 900) return 190;
    if (height <= 900 && height >= 810) return 260;
    if (height <= 810 && height >= 720) return 210;
    if (height <= 720 && height >= 630) return 160;
    return 200;
  }
  if (size < 1440 && size >= 1280) {
    if (height <= 1080 && height >= 990) return 220;
    if (height <= 990 && height >= 900) return 190;
    if (height <= 900 && height >= 810) return 250;
    if (height <= 810 && height >= 720) return 210;
    if (height <= 720 && height >= 630) return 160;
    return 200;
  }
  if (size < 1280 && size >= 1120) {
    if (height <= 1080 && height >= 990) return 220;
    if (height <= 990 && height >= 900) return 190;
    if (height <= 900 && height >= 810) return 270;
    if (height <= 810 && height >= 720) return 210;
    if (height <= 720 && height >= 630) return 160;
    return 200;
  }
  if (size < 1120 && size >= 960) {
    if (height <= 1080 && height >= 990) return 220;
    if (height <= 990 && height >= 900) return 190;
    if (height <= 900 && height >= 810) return 270;
    if (height <= 810 && height >= 720) return 220;
    if (height <= 720 && height >= 630) return 160;
    return 200;
  }
  return 200;
}

double imagePadding(size, height) {
  return 100;
}

class _CalendarHomePageState
    extends ModularState<CalendarHomePage, CalendarHomeController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          const TextHeaderScratched(title: 'EDIÇÕES ANTERIORES'),
          Expanded(
            child: Observer(builder: (_) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 48, horizontal: imagePadding(size, height)),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: imageSize(size, height),
                      crossAxisCount: crossAxisCount(size, height),
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
