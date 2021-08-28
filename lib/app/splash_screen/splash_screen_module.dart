import 'package:covid19app/app/app_repository.dart';
import 'package:covid19app/app/splash_screen/splash_screen_controller.dart';
import 'package:covid19app/app/splash_screen/splash_screen_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreenModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashScreenController(i.get<AppRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SplashScreenPage()),
      ];

  static Inject get to => Inject<SplashScreenModule>.of();
}
