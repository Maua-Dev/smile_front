import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
              child: GridView.builder(
                itemCount: ActivityEnum.values.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24),
                itemBuilder: (context, index) => FilterButtonWidget(
                  index: index,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
