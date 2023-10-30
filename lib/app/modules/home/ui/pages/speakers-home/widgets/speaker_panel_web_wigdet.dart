import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../../shared/entities/screen_variables.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../shared/helpers/utils/screen_helper.dart';
import '../../../../domain/infra/speakers_enum.dart';
import '../../widgets/header/h1_header_text_widget.dart';

class SpeakerPanelWebWidget extends StatelessWidget {
  final String title;
  final String description;
  final List<Widget> children;
  final int indexToShow;
  const SpeakerPanelWebWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.children,
      required this.indexToShow});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Screen.width(context) * 0.07,
      ),
      child: CustomPaint(
        painter: CustomShapePainter(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        H1HeaderTextWidget(
                          title: title,
                          fontSize:
                              Screen.width(context) < tabletSize ? 28 : 40,
                        ),
                        Text(
                          description,
                          style: AppTextStyles.headline1.copyWith(
                              fontSize:
                                  Screen.width(context) < tabletSize ? 14 : 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Observer(builder: (_) {
                    return Expanded(
                      child: Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: children,
                      ),
                    );
                  }),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.width / 5,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.brandingOrange, width: 10),
                            borderRadius: BorderRadius.circular(100000)),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.gray.withOpacity(0.3),
                                  width: 10),
                              borderRadius: BorderRadius.circular(100000)),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                                SpeakersEnum.values[indexToShow].linkPhoto),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 64),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(SpeakersEnum.values[indexToShow].name,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.headline1.copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  tabletSize
                                              ? 32
                                              : 46)),
                              SizedBox(
                                height: Screen.width(context) < tabletSize
                                    ? 32
                                    : 64,
                              ),
                              Text(
                                SpeakersEnum.values[indexToShow].description,
                                style: AppTextStyles.headline1.copyWith(
                                    fontSize: Screen.width(context) < tabletSize
                                        ? 14
                                        : 20),
                                textAlign: TextAlign.justify,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.brandingOrange
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(0, size.height * 0.5)
      ..lineTo(0, 0)
      ..lineTo(size.width * 0.3, 0)
      ..moveTo(size.width * 0.7, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height * 0.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
