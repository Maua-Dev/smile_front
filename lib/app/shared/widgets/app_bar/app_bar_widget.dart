import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/appbar_button_widget.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/app/shared/utils/s3_assets_url.dart';
import '../../themes/app_colors.dart';

class AppBarWidget extends StatefulWidget {
  final Function()? scrollToHome;
  final Function()? scrollToActivity;
  final Function()? scrollToSponsors;
  final Function()? redirect;
  final bool isErrorPage;
  const AppBarWidget({
    super.key,
    this.scrollToHome,
    this.scrollToActivity,
    this.scrollToSponsors,
    this.redirect,
    this.isErrorPage = false,
  });

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 40,
        backgroundColor: AppColors.brandingBlue,
        centerTitle: false,
        leadingWidth: 0,
        title: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width < 1024 ? 0 : 24),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                onTap: () {
                  Modular.to.navigate('/home/');
                },
                child: Stack(children: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            alignment: Alignment.centerLeft,
                            image: CachedNetworkImageProvider(
                              smile2023LogoUrl,
                            ))),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left:
                            MediaQuery.of(context).size.width < 1024 ? 83 : 86),
                    child: SizedBox(
                      height: 40,
                      child: VerticalDivider(
                        color: (AppColors.brandingOrange),
                        thickness: 2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width < 1024
                            ? 100
                            : 108),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              alignment: Alignment.centerLeft,
                              image: CachedNetworkImageProvider(
                                mauaLogoUrl,
                              ))),
                    ),
                  ),
                ])),
          ),
        ),
        actions: widget.isErrorPage
            ? [
                AppbarButtonWidget(
                  title: 'VOLTAR',
                  textStyle: AppTextStyles.buttonBold.copyWith(
                      color: Colors.white,
                      fontSize:
                          MediaQuery.of(context).size.width < 1300 ? 20 : 24),
                  paddingHorizontal:
                      MediaQuery.of(context).size.width < 1300 ? 8 : 16,
                  paddingVertical: 8,
                  widthSize: 160,
                  backgroundColor: AppColors.brandingOrange,
                  onPressed: () async {
                    Modular.to.navigate('/home/');
                  },
                ),
              ]
            : [
                if (MediaQuery.of(context).size.width > 1024)
                  AppbarButtonWidget(
                    title: 'HOME',
                    paddingHorizontal:
                        MediaQuery.of(context).size.width < 1300 ? 8 : 16,
                    paddingVertical: 8,
                    onPressed: () {
                      widget.scrollToHome!();
                    },
                  ),
                if (MediaQuery.of(context).size.width > 1024)
                  AppbarButtonWidget(
                    title: 'ATIVIDADES',
                    paddingHorizontal:
                        MediaQuery.of(context).size.width < 1300 ? 8 : 16,
                    paddingVertical: 8,
                    onPressed: () {
                      widget.scrollToActivity!();
                    },
                  ),
                if (MediaQuery.of(context).size.width > 1024)
                  AppbarButtonWidget(
                    title: 'PATROCINADORES',
                    paddingHorizontal:
                        MediaQuery.of(context).size.width < 1300 ? 8 : 16,
                    paddingVertical: 8,
                    onPressed: () {
                      widget.scrollToSponsors!();
                    },
                  ),
                if (MediaQuery.of(context).size.width > 1024)
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: AppbarButtonWidget(
                      title: 'LOGIN',
                      textStyle: AppTextStyles.buttonBold.copyWith(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width < 1300
                              ? 20
                              : 24),
                      paddingHorizontal:
                          MediaQuery.of(context).size.width < 1300 ? 8 : 16,
                      paddingVertical: 8,
                      widthSize: 160,
                      backgroundColor: AppColors.brandingOrange,
                      onPressed: () async {
                        widget.redirect!();
                      },
                    ),
                  )
              ]);
  }
}
