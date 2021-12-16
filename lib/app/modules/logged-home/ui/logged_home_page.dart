import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/logged-home/ui/widgets/navigation_button_widget.dart';

class LoggedHomePage extends StatefulWidget {
  const LoggedHomePage({Key? key}) : super(key: key);

  @override
  _LoggedHomePageState createState() => _LoggedHomePageState();
}

class _LoggedHomePageState extends State<LoggedHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          NavigationButtonWidget(
            title: 'Atividades Escritas',
            icon: Icons.ac_unit_outlined,
          )
        ],
      ),
    );
  }
}
