import 'package:covid19app/app/modules/analisy/pages/direction/components/direction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'direction_controller.dart';

class DirectionPage extends StatefulWidget {
  final String title;
  const DirectionPage({Key key, this.title = "Sertão Saúde"}) : super(key: key);

  @override
  _DirectionPageState createState() => _DirectionPageState();
}

class _DirectionPageState
    extends ModularState<DirectionPage, DirectionController> {
  //use 'controller' variable to access controllerx

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sertão Saúde"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('OK'),
        onPressed: () {
          Modular.to.popUntil(ModalRoute.withName('/'));
        },
      ),
      body: Center(
        child: Container(
          width: size.width * 0.95,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Onde devo procurar ajuda?',
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),
              DirectionCard(
                risk: true,
                title: "Fique em casa",
                color: Colors.green,
                text:
                    'Caso esteja apresentando apenas coriza, sem apresentar outro sintoma.',
              ),
              SizedBox(height: 16),
              DirectionCard(
                risk: true,
                title: "Fique alerta em casa",
                color: Theme.of(context).primaryColor,
                text: 'Se apresenta apenas sintomas como coriza e febre.',
              ),
              SizedBox(height: 16),
              DirectionCard(
                risk: true,
                title: "Posto de saúde",
                color: Colors.yellow[800],
                text:
                    'No caso de sintomas mais fortes, como coriza, febre e tosse.',
              ),
              SizedBox(height: 16),
              DirectionCard(
                risk: true,
                title: "Serviço de emergência",
                color: Colors.red,
                text:
                    'No caso de sintomas mais fortes, como coriza, febre, tosse e falta de ar.',
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
