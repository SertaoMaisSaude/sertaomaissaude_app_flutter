import 'package:covid19app/app/modules/home/pages/health_centers/health_center_repository.dart';
import 'package:covid19app/app/shared/models/health_center_model.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

part 'health_centers_controller.g.dart';

class HealthCentersController = _HealthCentersControllerBase
    with _$HealthCentersController;

abstract class _HealthCentersControllerBase with Store {
  final HealthCenterRepository _repository;

  @observable
  String districtSelected;

  @observable
  List<HealthCenterModel> centers;

  @observable
  List<HealthCenterModel> centersfiltred;

  @observable
  Set<String> neighborhoods;

  @observable
  String dropDownValue;

  _HealthCentersControllerBase(this._repository) {
    _fetchHealthCenters();
  }

  @action
  void searchCenter(String value) {
    this.dropDownValue = value;
    if (value != null) {
      this.centersfiltred = this
          .centers
          .where((element) =>
              element.neighborhood.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
  }

  _fetchHealthCenters() async {
    this.centers = await _repository.fetchHealthCenters();
    this.centersfiltred = this.centers;
    getNeighborhood();
  }

  void getNeighborhood() {
    this.neighborhoods = this.centers.map((e) => e.neighborhood).toSet();
  }

  Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
