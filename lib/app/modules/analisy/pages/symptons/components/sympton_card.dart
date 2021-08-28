import 'package:covid19app/app/modules/analisy/analisy_controller.dart';
import 'package:covid19app/app/modules/analisy/analisy_module.dart';
import 'package:covid19app/app/modules/analisy/components/select_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SymptonCard extends StatelessWidget {
  final int index;
  final _controller = AnalisyModule.to.get<AnalisyController>();

  SymptonCard({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SelectCardWidget(
          isSelected: _hasSympton(index),
          selectFunction: () {
            if (!_hasSympton(index)) {
              _controller.addSympton(_controller.symptons[index]);
            } else {
              _controller.removeSympton(_controller.symptons[index]);
            }
          },
          title: _controller.symptons[index].name,
        ),
      );
    });
  }

  bool _hasSympton(int index) {
    return _controller.citizenSymptons.contains(_controller.symptons[index]);
  }
}
