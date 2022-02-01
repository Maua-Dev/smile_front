import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/login/ui/widgets/first_tab.dart';
import 'package:smile_front/app/modules/login/ui/widgets/second_tab.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

class LoginTabBar extends StatefulWidget {
  const LoginTabBar({Key? key}) : super(key: key);

  @override
  _LoginTabBarState createState() => _LoginTabBarState();
}

class _LoginTabBarState extends State<LoginTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          // give the tab bar a height [can change hheight to preferred height]
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
                border: Border.all(color: Colors.white),
                color: Colors.white,
              ),
              labelColor: AppColors.brandingBlue,
              unselectedLabelColor: AppColors.brandingBlue,
              tabs: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const Tab(
                      text: 'Já Sou Cadastrado',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const Tab(
                      text: 'Não Sou Cadastrado',
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                FirstTab(),
                SecondTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
