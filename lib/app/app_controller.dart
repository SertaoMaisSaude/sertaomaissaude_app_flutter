import 'package:covid19app/app/shared/models/city_model.dart';
import 'package:covid19app/app/shared/models/health_center_model.dart';
import 'package:location/location.dart';
import 'package:mobx/mobx.dart';

import 'shared/models/blog_post_model.dart';
import 'shared/models/daily_news_model.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  @observable
  String city;

  @observable
  List<BlogPostModel> posts;
  @observable
  List<DailyNewsModel> dailyNews;

  @observable
  List<HealthCenterModel> healthCenters = [];

  @observable
  List<CityModel> cities;

  Future<Null> getLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    print(_locationData);
  }
}
