import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/widgets/app_bar/app_bar_widget.dart';
import '../../modules/home/ui/pages/footer/footer.dart';
import '../themes/app_text_styles.dart';
import '../widgets/drawer/end_drawer_widget.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({
    Key? key,
  }) : super(key: key);
  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: MediaQuery.of(context).size.width < 1024
            ? EndDrawerWidget(
                scrollToActivity: (() => Modular.to.navigate('/home/')),
                scrollToHome: (() => Modular.to.navigate('/home/')),
                scrollToSponsors: (() => Modular.to.navigate('/home/')),
              )
            : null,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: AppBarWidget(
              scrollToActivity: (() => Modular.to.navigate('/home/')),
              scrollToHome: (() => Modular.to.navigate('/home/')),
              scrollToSponsors: (() => Modular.to.navigate('/home/')),
              isErrorPage: true,
            )),
        body: Center(
            child: SizedBox(
          width: MediaQuery.of(context).size.width < 2200
              ? MediaQuery.of(context).size.width
              : 2200,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Página não encontrada...',
                          style: AppTextStyles.titleH1.copyWith(
                              fontSize: MediaQuery.of(context).size.width < 1024
                                  ? 38
                                  : 60),
                          textAlign: TextAlign.center),
                      Text(
                          'O link em que você clicou pode não estar funcionando, ou a página pode ter sido removida.',
                          style: AppTextStyles.body.copyWith(
                              fontSize: MediaQuery.of(context).size.width < 1024
                                  ? 16
                                  : 26),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
              const Footer()
            ],
          ),
        )));
  }
}
