import 'package:covid19app/app/modules/analisy/analisy_controller.dart';
import 'package:covid19app/app/modules/analisy/analisy_module.dart';
import 'package:covid19app/app/modules/analisy/components/analisy_sliver_app_bar.dart';
import 'package:covid19app/app/modules/analisy/pages/fever/components/fever_value_widget.dart';
import 'package:covid19app/app/modules/analisy/pages/fever/components/has_fever_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FeverPage extends StatefulWidget {
  final String title;
  const FeverPage({Key key, this.title = "Fever"}) : super(key: key);

  @override
  _FeverPageState createState() => _FeverPageState();
}

class _FeverPageState extends State<FeverPage> {
  final _controller = AnalisyModule.to.get<AnalisyController>();

  // final _homeController = HomeModule.to.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          bottomNavigationBar: SizedBox(
            height: 50,
            child: RaisedButton(
              onPressed: _controller.hasFever == null &&
                      _controller.validateFever == null
                  ? null
                  : () {
                      Navigator.of(context).pushNamed('analise/sintomas');
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
            slivers: [
              SliverPersistentHeader(
                delegate: AlisySliverAppBar(
                    expandedHeight: 220, image: "assets/icons/temperature.png"),
                pinned: true,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 18.0, left: 18, right: 18, bottom: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sente febre?',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      HasFeverWidget(),
                      SizedBox(height: 32),
                      AnimatedOpacity(
                        opacity: _controller.hasFever == true ? 1 : 0,
                        duration: Duration(milliseconds: 350),
                        child: FeverValueWidget(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
