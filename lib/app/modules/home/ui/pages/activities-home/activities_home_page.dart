import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/home/ui/pages/activities-home/pages/next_home_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/header/h1_header_text_widget.dart';
import 'package:smile_front/generated/l10n.dart';

import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/utils/s3_assets_url.dart';
import '../../../../dashboard/domain/infra/activity_enum.dart';

class ActivitiesHomePage extends StatefulWidget {
  const ActivitiesHomePage({Key? key}) : super(key: key);

  @override
  ActivityHomeState createState() => ActivityHomeState();
}

class ActivityHomeState extends State<ActivitiesHomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    var imgList = ActivityEnum.values
        .take(10)
        .map((ActivityEnum value) => NextHomePage(
            title: value.name,
            description: value.description,
            imageUrl: value.linkPhoto))
        .toList();
    imgList.add(NextHomePage(
        title: S.of(context).allActivities,
        description:
            '<a href="${s3AssetsBaseUrl}smile_pdf.pdf">${S.of(context).clickTodownload}</a>',
        imageUrl: '${s3AssetsBaseUrl}smile_home_clean.png'));
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        H1HeaderTextWidget(title: S.of(context).activitiesAndEventsTitle),
        SizedBox(
          height: width > 1024 ? height * 0.75 : height * 0.4,
          width: width * 0.9,
          child: CarouselSlider(
            items: imgList,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 10),
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
                width: MediaQuery.of(context).size.width < 1024 ? 12 : 15,
                height: MediaQuery.of(context).size.width < 1024 ? 12 : 15,
                margin: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal:
                        MediaQuery.of(context).size.width < 1024 ? 6 : 8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? AppColors.lightPurple
                            : AppColors.brandingBlue)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
        if (MediaQuery.of(context).size.width <= 1024)
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    MediaQuery.of(context).size.width < 800 ? 16.0 : 32),
            child: Text(
              ActivityEnum.values[_current].description,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width < 800 ? 14 : 18),
            ),
          )
      ],
    );
  }
}
