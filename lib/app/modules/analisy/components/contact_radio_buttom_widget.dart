import 'package:covid19app/app/modules/analisy/analisy_controller.dart';
import 'package:covid19app/app/modules/analisy/analisy_module.dart';
import 'package:covid19app/app/shared/models/covid_contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContatctRadioButtonWidget extends StatelessWidget {
  final CovidContactModel contactModel;
  final _controller = AnalisyModule.to.get<AnalisyController>();
  ContatctRadioButtonWidget({Key key, this.contactModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return InkWell(
          onTap: () {
            _controller.changeContact(contactModel);
          },
          child: AnimatedContainer(
            margin: EdgeInsets.all(
                _controller.citizenContact != contactModel ? 24 : 16),
            duration: Duration(milliseconds: 700),
            decoration: BoxDecoration(
              color: _controller.citizenContact != contactModel
                  ? null
                  : Colors.white,
              border: Border.all(
                color: _controller.citizenContact == contactModel
                    ? Color(0xFF43D7A1)
                    : Colors.grey[300],
                width: 2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Center(
              child: ListTile(
                leading: Radio<CovidContactModel>(
                  activeColor: Color(0xFF43D7A1),
                  groupValue: _controller.citizenContact,
                  onChanged: (CovidContactModel value) {
                    _controller.changeContact(value);
                  },
                  value: contactModel,
                ),
                title: Text(contactModel.description),
              ),
            ),
          ),
        );
      },
    );
  }
}
