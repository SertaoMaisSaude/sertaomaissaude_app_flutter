import 'package:covid19app/app/modules/analisy/analisy_controller.dart';
import 'package:covid19app/app/modules/analisy/analisy_module.dart';
import 'package:covid19app/app/modules/analisy/components/analisy_sliver_app_bar.dart';
import 'package:covid19app/app/modules/analisy/components/contact_radio_buttom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CovidContactPage extends StatefulWidget {
  final String title;
  const CovidContactPage({Key key, this.title = "CovidContact"})
      : super(key: key);

  @override
  _CovidContactPageState createState() => _CovidContactPageState();
}

class _CovidContactPageState extends State<CovidContactPage> {
  final _controller = AnalisyModule.to.get<AnalisyController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
            bottomNavigationBar: SizedBox(
              height: 50,
              child: RaisedButton(
                onPressed: _controller.citizenContact == null
                    ? null
                    : () {
                        Navigator.of(context).pushNamed('analise/comorbidades');
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
                      expandedHeight: 220, image: 'assets/icons/distance.png'),
                  pinned: true,
                ),
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 18),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Contato',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                )),
                SliverFixedExtentList(
                    delegate: SliverChildBuilderDelegate(
                      (_, index) {
                        return ContatctRadioButtonWidget(
                          contactModel: _controller.contacts[index],
                        );
                      },
                      childCount: _controller.contacts.length,
                    ),
                    itemExtent: 140)
              ],
            ));
      },
    );
  }
}
