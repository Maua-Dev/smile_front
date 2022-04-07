import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/activity_home_controller.dart';
import 'package:smile_front/app/modules/home/ui/pages/activities-home/pages/next_home_page.dart';

import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/widgets/text-header/text_header.dart';
import '../../../../dashboard/domain/infra/activity_enum.dart';

class ActivitiesHomePage extends StatefulWidget {
  const ActivitiesHomePage({Key? key}) : super(key: key);

  @override
  ActivityHomeState createState() => ActivityHomeState();
}

class ActivityHomeState
    extends ModularState<ActivitiesHomePage, ActivityHomeController> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  var imgList = ActivityEnum.values
      .map((ActivityEnum value) => NextHomePage(
          title: value.name,
          description: value.description,
          imageUrl: value.linkPhoto))
      .toList();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: TextHeader(
            title: 'Atividades',
            leftPadding: 32,
            color: AppColors.brandingOrange,
          ),
        ),
        SizedBox(
          height: height * 0.75,
          width: width * 0.9,
          child: CarouselSlider(
            items: imgList,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 6),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                height: height,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 15,
                height: 15,
                margin:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? AppColors.lightPurple
                            : AppColors.brandingPurple)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}