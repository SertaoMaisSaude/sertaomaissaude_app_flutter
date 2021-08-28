import 'package:covid19app/app/shared/constants.dart';
import 'package:covid19app/app/shared/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: DEBUG,
      title: 'COVID-19',
      theme: AppTheme().themeData(),
      initialRoute: '/splash',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
