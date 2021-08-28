import 'package:covid19app/app/modules/analisy/analisy_controller.dart';
import 'package:covid19app/app/modules/analisy/analisy_module.dart';
import 'package:covid19app/app/modules/analisy/components/select_card_widget.dart';
import 'package:flutter/material.dart';

class HasFeverWidget extends StatelessWidget {
  final _controller = AnalisyModule.to.get<AnalisyController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SelectCardWidget(
              title: "Sim",
              isSelected:
                  _controller.hasFever == null ? false : _controller.hasFever,
              selectFunction: () {
                if (_controller.hasFever == true) {
                  _controller.hasFever = null;
                } else {
                  _controller.hasFever = true;
                }
              },
            ),
            SelectCardWidget(
              title: "Não",
              isSelected:
                  _controller.hasFever == null ? false : !_controller.hasFever,
              selectFunction: () {
                if (_controller.hasFever == false) {
                  _controller.changeFeverValue(null);
                  _controller.hasFever = null;
                } else {
                  _controller.hasFever = false;
                }
              },
            ),
          ],
        )
      ],
    );
  }
}
