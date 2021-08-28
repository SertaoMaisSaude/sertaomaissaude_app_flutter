import 'package:covid19app/app/app_repository.dart';
import 'package:covid19app/app/app_controller.dart';
import 'package:covid19app/app/app_widget.dart';
import 'package:covid19app/app/modules/analisy/analisy_module.dart';
import 'package:covid19app/app/modules/home/home_module.dart';
import 'package:covid19app/app/shared/constants.dart';

import 'package:covid19app/app/shared/custom_dio/custom_dio.dart';
import 'package:covid19app/app/shared/custom_hasura_connect/custom_hasura_connect.dart';
import 'package:covid19app/app/splash_screen/splash_screen_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CustomDio(Dio())),
        Bind((i) => AppController()),
        Bind((i) => AppRepository(i.get<CustomDio>())),
        Bind((i) => CustomHasuraConnect(HasuraConnect(HASURA_URL)))
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/splash', module: SplashScreenModule()),
        Router(
          '/analise',
          module: AnalisyModule(),
          transition: TransitionType.fadeIn,
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
