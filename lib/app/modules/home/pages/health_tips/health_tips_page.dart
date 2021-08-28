import 'package:covid19app/app/modules/home/home_module.dart';
import 'package:covid19app/app/modules/home/pages/health_tips/components/health_tips_widget.dart';
import 'package:covid19app/app/modules/home/pages/health_tips/health_tips_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HealthTipsPage extends StatefulWidget {
  final String title;
  const HealthTipsPage({Key key, this.title = "HealthTips"}) : super(key: key);

  @override
  _HealthTipsPageState createState() => _HealthTipsPageState();
}

class _HealthTipsPageState extends State<HealthTipsPage> {
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final controller = HomeModule.to.get<HealthTipsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // here the desired height
          child: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xFF05A8F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Text(
              'Dicas',
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Observer(builder: (_) {
            return RefreshIndicator(
                key: _refreshIndicatorKey,
                child: (controller.status == TipsStatus.done)
                    ? ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: controller.tips.length,
                        itemBuilder: (context, index) => HealthTipsWidget(
                          controller.tips[index],
                        ),
                      )
                    : (controller.status == TipsStatus.error ||
                            controller.status == TipsStatus.none)
                        ? ListView(
                            physics: AlwaysScrollableScrollPhysics(),
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.file_download,
                                    size: 100,
                                    color: Colors.white30,
                                  ),
                                  Text(
                                    "Deslise para atualizar página",
                                    style: TextStyle(
                                        fontSize: 50,
                                        color: Colors.white30,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              )
                            ],
                          )
                        : ListView(
                            physics: AlwaysScrollableScrollPhysics(),
                            children: <Widget>[],
                          ),
                onRefresh: () async => controller.fetchPosts());
          }),
        ));
  }
}
