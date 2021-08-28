import 'package:covid19app/app/modules/analisy/analisy_controller.dart';
import 'package:covid19app/app/modules/analisy/analisy_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FeverValueWidget extends StatelessWidget {
  final _controller = AnalisyModule.to.get<AnalisyController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            'Se possui um termômetro, informe a sua temperatura',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
        Observer(
          builder: (_) {
            return TextField(
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter(
                      RegExp('^[0-9]{0,6}(\\.[0-9]{0,1})?\$')),
              ],
              onChanged: _controller.changeFeverValue,
              enabled: _controller.hasFever,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: "Temperatura corporal",
                errorText: _controller.validateFever,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
