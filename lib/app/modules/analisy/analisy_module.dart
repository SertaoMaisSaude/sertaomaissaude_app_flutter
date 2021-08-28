import 'package:covid19app/app/modules/analisy/pages/direction/direction_controller.dart';
import 'package:covid19app/app/modules/analisy/pages/comorbidities/comorbidities_controller.dart';
import 'package:covid19app/app/app_module.dart';
import 'package:covid19app/app/modules/analisy/analisy_controller.dart';
import 'package:covid19app/app/modules/analisy/analisy_page.dart';
import 'package:covid19app/app/modules/analisy/analisy_repository.dart';
import 'package:covid19app/app/modules/analisy/pages/citizen_info/citizen_info_controller.dart';
import 'package:covid19app/app/modules/analisy/pages/citizen_info/citizen_info_page.dart';
import 'package:covid19app/app/modules/analisy/pages/comorbidities/comorbidities_page.dart';
import 'package:covid19app/app/modules/analisy/pages/covid_contact/covid_contact_controller.dart';
import 'package:covid19app/app/modules/analisy/pages/covid_contact/covid_contact_page.dart';
import 'package:covid19app/app/modules/analisy/pages/direction/direction_page.dart';
import 'package:covid19app/app/modules/analisy/pages/fever/fever_controller.dart';
import 'package:covid19app/app/modules/analisy/pages/fever/fever_page.dart';
import 'package:covid19app/app/modules/analisy/pages/symptons/symptons_controller.dart';
import 'package:covid19app/app/modules/analisy/pages/symptons/symptons_page.dart';
import 'package:covid19app/app/shared/custom_dio/custom_dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnalisyModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DirectionController()),
        Bind((i) => ComorbiditiesController()),
        Bind((i) => FeverController()),
        Bind((i) => SymptonsController()),
        Bind((i) => CovidContactController()),
        Bind((i) => CitizenInfoController()),
        Bind((i) => AnalisyRepository(AppModule.to.get<CustomDio>())),
        Bind((i) => AnalisyController(i.get<AnalisyRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AnalisyPage()),
        Router('/febre', child: (_, args) => FeverPage()),
        Router('/sintomas', child: (_, args) => SymptonsPage()),
        Router('/comorbidades', child: (_, args) => ComorbiditiesPage()),
        Router('/contato', child: (_, args) => CovidContactPage()),
        Router('/informacoes', child: (_, args) => CitizenInfoPage()),
        Router('/direction', child: (_, args) => DirectionPage()),
      ];

  static Inject get to => Inject<AnalisyModule>.of();
}
