import 'package:covid19app/app/app_controller.dart';
import 'package:covid19app/app/app_module.dart';
import 'package:covid19app/app/modules/analisy/analisy_controller.dart';
import 'package:covid19app/app/modules/analisy/analisy_module.dart';
import 'package:covid19app/app/shared/models/health_center_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CitizenInfoComponetns {
  final _controller = AnalisyModule.to.get<AnalisyController>();
  final _appController = AppModule.to.get<AppController>();
  TextFormField phoneForm() {
    return TextFormField(
      inputFormatters: [_controller.maskPhone],
      onChanged: _controller.changePhoneNumber,
      autocorrect: false,
      maxLength: 15,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: "Telefone",
        hintText: "(XX) XXXXX-XXXX",
        errorText: _controller.validatePhone,
      ),
    );
  }

  TextFormField nameForm() {
    return TextFormField(
      autocorrect: false,
      onChanged: _controller.changeName,
      decoration: InputDecoration(
        labelText: "Nome completo",
        errorText: _controller.validateName,
        border: OutlineInputBorder(),
      ),
    );
  }

  Container sexForm() {
    return Container(
      padding: EdgeInsets.only(left: 9, top: 3, right: 3, bottom: 3),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(2),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            hint: Text("Sexo"),
            value: _controller.sex,
            isExpanded: true,
            items: [
              DropdownMenuItem(
                child: Text('Masculino'),
                value: 'M',
              ),
              DropdownMenuItem(
                child: Text('Feminino'),
                value: 'F',
              )
            ],
            onChanged: _controller.changeSex),
      ),
    );
  }

  TextFormField ageForm() {
    return TextFormField(
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      autocorrect: false,
      keyboardType: TextInputType.number,
      onChanged: _controller.changeAge,
      maxLengthEnforced: true,
      maxLength: 3,
      decoration: InputDecoration(
        labelText: "Idade",
        errorText: _controller.validateAge,
        border: OutlineInputBorder(),
      ),
    );
  }

  TextFormField cepForm() {
    return TextFormField(
      autocorrect: false,
      onChanged: _controller.changeCep,
      maxLength: 9,
      keyboardType: TextInputType.number,
      inputFormatters: [_controller.maskCep],
      decoration: InputDecoration(
        errorText: _controller.validateCep,
        labelText: "CEP",
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget neighborhoodForm(TextEditingController txtNeighborhood) {
    return AnimatedOpacity(
      opacity: 1,
      duration: Duration(milliseconds: 350),
      child: TextFormField(
        onChanged: _controller.changeNeighborhood,
        controller: txtNeighborhood,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          errorText: _controller.validateNeighborhood,
          labelText: "Bairro",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget psfForm() {
    return AnimatedOpacity(
      //opacity: _controller.neighborhood != null ? 1 : 0,
      opacity: 1,
      duration: Duration(milliseconds: 350),
      child: Container(
          padding: EdgeInsets.only(left: 9, top: 3, right: 3, bottom: 3),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(2),
            ),
          ),
          // child: _healthcenters != null
          //     ? DropdownButtonHideUnderline(
          child: DropdownButtonHideUnderline(
            child: DropdownButton<HealthCenterModel>(
                value: _controller.healthCenter,
                hint: Text("Informe o seu PSF"),
                isExpanded: true,
                onChanged: _controller.changeHealthCenter,
                items: _appController.healthCenters
                    .map<DropdownMenuItem<HealthCenterModel>>(
                        (HealthCenterModel value) {
                  return DropdownMenuItem<HealthCenterModel>(
                    value: value,
                    child: Text(value.name),
                  );
                }).toList()),
          )
          //: Container(), //TODO ver isso
          ),
    );
  }
}
