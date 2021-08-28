import 'package:covid19app/app/modules/analisy/analisy_module.dart';
import 'package:covid19app/app/modules/analisy/pages/fever/fever_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'analisy_controller.dart';

class AnalisyPage extends StatefulWidget {
  final String title;
  const AnalisyPage({Key key, this.title = "Analise"}) : super(key: key);

  @override
  _AnalisyPageState createState() => _AnalisyPageState();
}

class _AnalisyPageState extends ModularState<AnalisyPage, AnalisyController> {
  //use 'controller' variable to access controller
  final _controller = AnalisyModule.to.get<AnalisyController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        switch (_controller.pageStatus) {
          case AnalisyStatus.error:
            return ErrorWidget();
          case AnalisyStatus.loading:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case AnalisyStatus.sucess:
            return FeverPage();
          case AnalisyStatus.none:
            return ErrorWidget();
        }
        if (_controller.contacts == null ||
            _controller.symptons == null ||
            _controller.citizenRiskGroups == null) {
          return ErrorWidget();
        }
        return Container();
      }),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  final _controller = AnalisyModule.to.get<AnalisyController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Erro de conexão"),
          FlatButton(
            child: Text('Tentar novamente?'),
            onPressed: () {
              _controller.fetchAll();
            },
          ),
        ],
      ),
    );
  }
}
