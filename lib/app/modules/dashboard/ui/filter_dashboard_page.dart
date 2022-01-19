import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/dashboard/ui/widgets/filter_button_widget.dart';
import 'package:smile_front/app/shared/widgets/text_header_scratched.dart';

class FilterDashboardPage extends StatefulWidget {
  const FilterDashboardPage({Key? key}) : super(key: key);

  @override
  _FilterDashboardPageState createState() => _FilterDashboardPageState();
}

class _FilterDashboardPageState extends State<FilterDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TextHeaderScratched(title: 'Atividades'),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, mainAxisSpacing: 16, crossAxisSpacing: 32),
              itemBuilder: (context, index) => FilterButtonWidget(
                index: index,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
