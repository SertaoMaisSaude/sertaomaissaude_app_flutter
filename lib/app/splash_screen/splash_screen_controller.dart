import 'package:covid19app/app/app_controller.dart';
import 'package:covid19app/app/app_module.dart';
import 'package:covid19app/app/app_repository.dart';
import 'package:mobx/mobx.dart';

part 'splash_screen_controller.g.dart';

class SplashScreenController = _SplashScreenControllerBase
    with _$SplashScreenController;

abstract class _SplashScreenControllerBase with Store {
  final _appController = AppModule.to.get<AppController>();

  final AppRepository _repository;

  _SplashScreenControllerBase(this._repository);

  Future<Null> _fetchCities() async {
    this._appController.cities = await _repository.fetchCities();
  }

  Future<Null> fetchAll() async {
    await this._fetchPosts();
    await this._fetchReports();
    await this._fetchCities();
    await this._fetchHealthCenters();
  }

  Future<Null> _fetchPosts() async {
    this._appController.posts = await _repository.fetchPosts();
  }

  Future<Null> _fetchHealthCenters() async {
    this._appController.healthCenters =
        await this._repository.fetchHealthCenterByNeighborhood();
  }

  Future<Null> _fetchReports() async {
    final list = await _repository.fetchDailyNews();
    if (list.length > 7) {
      this._appController.dailyNews =
          list.getRange(list.length - 7, list.length).toList();
    } else {
      this._appController.dailyNews = list;
    }
  }
}
