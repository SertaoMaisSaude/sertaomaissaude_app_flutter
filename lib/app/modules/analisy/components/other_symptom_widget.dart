import 'package:covid19app/app/modules/analisy/analisy_controller.dart';
import 'package:covid19app/app/modules/analisy/analisy_module.dart';
import 'package:flutter/material.dart';

class OtherSymptomWidget extends StatelessWidget {
  final _controller = AnalisyModule.to.get<AnalisyController>();
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        _controller.otherSympton = value;
      },
      decoration: InputDecoration(
        hintText: "Outro Sintoma",
        border: OutlineInputBorder(),
      ),
    );
  }
}
