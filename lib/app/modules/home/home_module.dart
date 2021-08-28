import 'package:covid19app/app/modules/home/pages/dashboard/dashboard_controller.dart';
import 'package:covid19app/app/modules/home/pages/health_centers/health_center_repository.dart';
import 'package:covid19app/app/modules/home/pages/health_centers/health_centers_controller.dart';
import 'package:covid19app/app/modules/home/pages/daily_news/daily_news_controller.dart';
import 'package:covid19app/app/app_module.dart';
import 'package:covid19app/app/modules/home/pages/health_centers/health_centers_page.dart';
import 'package:covid19app/app/modules/home/pages/health_tips/health_tips_page.dart';
import 'package:covid19app/app/modules/home/pages/health_tips/health_tips_repository.dart';
import 'package:covid19app/app/modules/home/pages/health_tips/health_tips_controller.dart';
import 'package:covid19app/app/modules/home/pages/feed/feed_controller.dart';
import 'package:covid19app/app/modules/home/pages/about/about_controller.dart';
import 'package:covid19app/app/modules/home/home_controller.dart';
import 'package:covid19app/app/shared/custom_dio/custom_dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:covid19app/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HealthCenterRepository(AppModule.to.get<CustomDio>())),
        Bind((i) => HealthCentersController(i.get<HealthCenterRepository>())),
        Bind((i) => DailyNewsController()),
        Bind((i) => HealthTipsRepository(AppModule.to.get<CustomDio>())),
        Bind((i) => HealthTipsController(i.get<HealthTipsRepository>())),
        Bind((i) => FeedController()),
        Bind((i) => AboutController()),
        Bind((i) => HomeController()),
        Bind((i) => DashboardController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('dicas', child: (_, args) => HealthTipsPage()),
        Router('centros-de-saude', child: (_, args) => HealthCentersPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
