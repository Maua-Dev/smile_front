import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/ui/widgets/filter_button_widget.dart';
import 'package:smile_front/app/shared/widgets/text_header_scratched.dart';
import 'package:smile_front/app/shared/widgets/vertical_nav_bar/vertical_nav_bar.dart';

class FilterDashboardPage extends StatefulWidget {
  const FilterDashboardPage({Key? key}) : super(key: key);

  @override
  _FilterDashboardPageState createState() => _FilterDashboardPageState();
}

class _FilterDashboardPageState extends State<FilterDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: [
          const VerticalNavBar(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 50.0, top: 30),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    const Icon(
                      Icons.notifications,
                      size: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.settings,
                      size: 40,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.grey),
                      height: 80,
                      width: 80,
                    ),
                  ]),
                ),
                const TextHeaderScratched(title: 'Atividades'),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 64, vertical: 32),
                    child: GridView.builder(
                      itemCount: ActivityEnum.values.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
          ),
        ],
      ),
    );
  }
}
