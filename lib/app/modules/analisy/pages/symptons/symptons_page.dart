import 'package:covid19app/app/modules/analisy/analisy_controller.dart';
import 'package:covid19app/app/modules/analisy/analisy_module.dart';
import 'package:covid19app/app/modules/analisy/components/analisy_sliver_app_bar.dart';
import 'package:covid19app/app/modules/analisy/components/select_card_widget.dart';
import 'package:covid19app/app/modules/analisy/pages/symptons/components/sympton_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SymptonsPage extends StatefulWidget {
  final String title;

  const SymptonsPage({Key key, this.title = "Sintomas"}) : super(key: key);

  @override
  _SymptonsPageState createState() => _SymptonsPageState();
}

class _SymptonsPageState extends State<SymptonsPage> {
  final _controller = AnalisyModule.to.get<AnalisyController>();

  _addOtherSympton() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("O que você sente?"),
          content: TextField(
            onChanged: _controller.changeOtherSympton,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();

                _controller.changeOtherSympton(null);
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
                Navigator.of(context).pushNamed('analise/contato');
              },
              color: Color(0xFF43D7A1),
              child: Text(
                'Continuar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          body: _controller.pageStatus == AnalisyStatus.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverPersistentHeader(
                      delegate: AlisySliverAppBar(
                          expandedHeight: 220,
                          image: 'assets/icons/symptom.png'),
                      pinned: true,
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 18.0, top: 18, right: 18),
                            child: Text(
                              'O que você está sentindo?',
                              textAlign: TextAlign.start,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 16,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: SelectCardWidget(
                              isSelected: _controller.citizenSymptons == null ||
                                  _controller.citizenSymptons.isEmpty,
                              title: "Sem sintoma",
                              selectFunction: (){
                                _controller.citizenSymptons.clear();
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
                          return SymptonCard(index: index);
                        },
                        childCount: _controller.symptons.length,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: SelectCardWidget(
                              isSelected: _controller.otherSympton == null
                                  ? false
                                  : true,
                              title: _controller.otherSympton == null
                                  ? "Outro sintoma"
                                  : _controller.otherSympton,
                              selectFunction: _addOtherSympton,
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
}
