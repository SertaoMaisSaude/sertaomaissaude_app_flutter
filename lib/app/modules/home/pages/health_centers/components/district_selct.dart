import 'package:covid19app/app/modules/home/home_module.dart';
import 'package:covid19app/app/modules/home/pages/health_centers/health_centers_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DistrctSelect extends StatelessWidget {

  final _controller = HomeModule.to.get<HealthCentersController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        if (_controller.centers == null) {
          return Text('Centros de saúde');
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: TextField(
              onChanged: _controller.searchCenter,
              decoration: InputDecoration(
                  hintText: 'Bairro',
                  hintStyle: TextStyle(color: Colors.white),
                  suffix: Icon(
                    Icons.search,
                    color: Colors.white,
                  )),
            ),
          );
        }
      },
    );
  }
}
