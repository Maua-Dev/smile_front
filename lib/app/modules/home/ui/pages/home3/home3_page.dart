import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

class Home3Page extends StatefulWidget {
  const Home3Page({Key? key}) : super(key: key);

  @override
  _HomePage3State createState() => _HomePage3State();
}

class _HomePage3State extends State<Home3Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: AppColors.lightBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: Container(
                        height: 400,
                        width: 400,
                        color: AppColors.brandingBlue,
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      height: 400,
                      child: Image.network(
                          'https://avatars.githubusercontent.com/u/24724451?v=4'),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: const [
                    Text('NOME COMPLETO'),
                    Text('subtitulo'),
                    Text('Texto')
                  ],
                ),
              )
            ],
          ),
          Row(),
        ],
      ),
    ));
  }
}
