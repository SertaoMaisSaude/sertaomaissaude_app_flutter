import 'package:covid19app/app/shared/custom_dio/custom_dio.dart';
import 'package:covid19app/app/shared/models/health_center_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HealthCenterRepository extends Disposable {
  final CustomDio _customDio;

  HealthCenterRepository(this._customDio);

  Future<List<HealthCenterModel>> fetchHealthCenters() async {
    final response = await _customDio.client.get('health-center/list/');
    return HealthCenterModel.fromJsonList(response.data);
  }

  @override
  void dispose() {}
}
