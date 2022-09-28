import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/smile_loading_logo_widget.dart';
import 'package:smile_front/app/shared/widgets/app_bar/app_bar.dart';
import '../../modules/home/ui/pages/footer/footer.dart';
import '../themes/app_text_styles.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({Key? key}) : super(key: key);
  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  final homeKey = GlobalKey();
  final activityKey = GlobalKey();
  final sponsorsKey = GlobalKey();

  Future awaitToLoad() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(56), child: AppBarDesign()),
        body: FutureBuilder(
            future: awaitToLoad(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width < 2200
                        ? MediaQuery.of(context).size.width
                        : 2200,
                    child: SingleChildScrollView(
                      child: Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 160.0),
                              child: Text('Página não encontrada...',
                                  style: AppTextStyles.titleH1.copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  1024
                                              ? 40
                                              : 60),
                                  textAlign: TextAlign.center),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width < 1024
                                          ? 11
                                          : 0),
                              child: Text(
                                  'O link em que você clicou pode não estar funcionando, ou a página pode ter sido removida.',
                                  style: AppTextStyles.body.copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  1024
                                              ? 15
                                              : 25),
                                  textAlign: TextAlign.center),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.width < 1024
                                          ? 4
                                          : 24),
                              child: SizedBox(
                                height: 184,
                                width: MediaQuery.of(context).size.width < 1024
                                    ? 400
                                    : 800,
                              ),
                            ),
                            const Footer()
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SmileLoadingLogoWidget(),
                    CircularProgressIndicator(),
                  ],
                ));
              }
            }));
  }
}
