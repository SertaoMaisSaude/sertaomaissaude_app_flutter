import 'package:covid19app/app/modules/home/home_module.dart';
import 'package:covid19app/app/modules/home/pages/about/about_page.dart';
import 'package:covid19app/app/modules/home/pages/daily_news/daily_news_page.dart';
import 'package:covid19app/app/modules/home/pages/dashboard/dashboard_page.dart';
import 'package:covid19app/app/modules/home/pages/feed/feed_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final _controller = HomeModule.to.get<HomeController>();

  @override
  void initState() {
    super.initState();
    _controller.pageController = PageController(initialPage: 1, keepPage: true);
  }

  @override
  void dispose() {
    _controller.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          body: PageView(
            controller: _controller.pageController,
            onPageChanged: (index) {
              _controller.changeIndex(index);
            },
            children: <Widget>[
              AboutPage(),
              FeedPage(),
              DailyNewsPage(),
              DashboardPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _controller.index,
            onTap: (int index) {
              _controller.changeIndex(index);
              _controller.pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            },
            unselectedItemColor: Colors.grey,
            selectedItemColor: Color(0xFF05A8F3),
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/tips_icon.png")),
                title: Text('Sobre'),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/feed_icon.png"),
                ),
                title: Text('Início'),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/boletim_icon.png"),
                ),
                title: Text('Boletim'),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/dashboard_icon.png"),
                ),
                title: Text('Dashboard'),
              ),
            ],
          ),
        );
      },
    );
  }
}
