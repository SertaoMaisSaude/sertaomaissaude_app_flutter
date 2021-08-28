import 'package:covid19app/app/modules/analisy/analisy_controller.dart';
import 'package:covid19app/app/modules/analisy/analisy_module.dart';
import 'package:location/location.dart';
import 'package:mobx/mobx.dart';

part 'citizen_info_controller.g.dart';

class CitizenInfoController = _CitizenInfoControllerBase
    with _$CitizenInfoController;

abstract class _CitizenInfoControllerBase with Store {
  final _analisyController = AnalisyModule.to.get<AnalisyController>();

  Future<bool> verifyService() async {
    Location location = new Location();

    bool _serviceEnabled;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
      return true;
    }
    return true;
  }

  Future<bool> getLocationPermission() async {
    PermissionStatus _permissionGranted;
    Location location = new Location();

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
      return true;
    }
    return true;
  }

  Future<LocationData> getLocation() async {
    Location location = new Location();
    final enable = await verifyService();
    final permissionGranted = await getLocationPermission();

    if (!permissionGranted) {
      return null;
    }
    if (!enable) {
      return null;
    }

    return await location.getLocation();
  }

  @computed
  bool get validateForm {
    if (_analisyController.validateAge == null &&
        _analisyController.validateCep == null &&
        _analisyController.validatePhone == null &&
        _analisyController.validateName == null) {
      return true;
    }
    return false;
  }
}
