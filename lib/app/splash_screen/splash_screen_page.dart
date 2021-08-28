import 'package:covid19app/app/app_controller.dart';
import 'package:covid19app/app/app_module.dart';
import 'package:covid19app/app/splash_screen/splash_screen_controller.dart';
import 'package:covid19app/app/splash_screen/splash_screen_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final _controller = SplashScreenModule.to.get<SplashScreenController>();
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    _controller.fetchAll().whenComplete(() => Modular.to.pop());
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            child: Image.asset('assets/images/logo.png'),
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            'Carregando...',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
