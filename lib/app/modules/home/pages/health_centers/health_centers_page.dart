import 'package:covid19app/app/modules/home/home_module.dart';
import 'package:covid19app/app/modules/home/pages/health_centers/components/district_selct.dart';
import 'package:covid19app/app/modules/home/pages/health_centers/components/health_center_tile.dart';
import 'package:covid19app/app/modules/home/pages/health_centers/health_centers_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HealthCentersPage extends StatefulWidget {
  final String title;

  const HealthCentersPage({Key key, this.title = "HealthCenters"})
      : super(key: key);

  @override
  _HealthCentersPageState createState() => _HealthCentersPageState();
}

class _HealthCentersPageState extends State<HealthCentersPage> {
  final _controller = HomeModule.to.get<HealthCentersController>();
  @override
  void dispose() {
    _controller.searchCenter('');
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: DistrctSelect(),
      ),
      body: Observer(
        builder: (BuildContext context) {
          if (_controller.centersfiltred == null) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: _controller.centersfiltred.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (_, index) {
              return HealthCenterTile(
                healthCenter: _controller.centersfiltred[index],
              );
            },
          );
        },
      ),
    );
  }
}
