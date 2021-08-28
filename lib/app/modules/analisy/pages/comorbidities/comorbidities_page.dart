import 'package:covid19app/app/modules/analisy/analisy_controller.dart';
import 'package:covid19app/app/modules/analisy/analisy_module.dart';
import 'package:covid19app/app/modules/analisy/components/analisy_sliver_app_bar.dart';
import 'package:covid19app/app/modules/analisy/components/select_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ComorbiditiesPage extends StatefulWidget {
  final String title;
  const ComorbiditiesPage({Key key, this.title = "Comorbidities"})
      : super(key: key);

  @override
  _ComorbiditiesPageState createState() => _ComorbiditiesPageState();
}

class _ComorbiditiesPageState extends State<ComorbiditiesPage> {
  final _controller = AnalisyModule.to.get<AnalisyController>();
  _addOtherComorbiditie() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Digite o nome do seu grupo de risco:"),
          content: TextField(
            onChanged: _controller.changeOtherRiskGroup,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {
                _controller.changeOtherRiskGroup(null);
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          bottomNavigationBar: SizedBox(
            height: 50,
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('analise/informacoes');
              },
              color: Color(0xFF43D7A1),
              child: Text(
                'Continuar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          body: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverPersistentHeader(
                delegate: AlisySliverAppBar(
                    expandedHeight: 220, image: 'assets/icons/lungs.png'),
                pinned: true,
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18, right: 18, top: 18),
                      child: Text(
                        'Você faz parte de algum grupo de risco?',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: SelectCardWidget(
                        isSelected: _controller.citizenRiskGroups == null ||
                            _controller.citizenRiskGroups.isEmpty,
                        title: "Não pertenço a nenhum grupo de risco",
                        selectFunction: () {
                          _controller.citizenRiskGroups.clear();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    maxCrossAxisExtent: 250),
                delegate: SliverChildBuilderDelegate(
                  (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Observer(builder: (_) {
                        return SelectCardWidget(
                          isSelected: _hasRiskGroup(index),
                          selectFunction: () {
                            _controller.citizenRiskGroups.forEach((element) {
                            });
                            if (!_hasRiskGroup(index)) {
                              _controller
                                  .addRiskGroup(_controller.riskGroups[index]);
                            } else {
                              _controller.removeRiskGroup(
                                  _controller.riskGroups[index]);
                            }
                          },
                          title: _controller.riskGroups[index].name,
                        );
                      }),
                    );
                  },
                  childCount: _controller.riskGroups.length,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: SelectCardWidget(
                        isSelected:
                            _controller.otherRiskGroup == null ? false : true,
                        title: _controller.otherRiskGroup == null
                            ? "Outro"
                            : _controller.otherRiskGroup,
                        selectFunction: _addOtherComorbiditie,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  bool _hasRiskGroup(int index) {
    return _controller.citizenRiskGroups
        .contains(_controller.riskGroups[index]);
  }
}
