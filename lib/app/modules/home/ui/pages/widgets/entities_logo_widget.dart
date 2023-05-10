import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/home/domain/infra/maua_entities_enum.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/header/h1_header_text_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/breakpoint.dart';
import 'package:smile_front/generated/l10n.dart';

class EntitiesCarousel extends StatefulWidget {
  const EntitiesCarousel({Key? key}) : super(key: key);

  @override
  EntitiesCarouselState createState() => EntitiesCarouselState();
}

class EntitiesCarouselState extends State<EntitiesCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    var imgList = MauaEntitiesEnum.values
        .take(4)
        .map((MauaEntitiesEnum value) => Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(value.logoUrl),
                fit: BoxFit.contain,
              ),
            )))
        .toList();
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        H1HeaderTextWidget(title: S.of(context).mauaEntititesTitle),
        SizedBox(
          height: width > breakpointMobile ? height * 0.75 : height * 0.4,
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
      ],
    );
  }
}
