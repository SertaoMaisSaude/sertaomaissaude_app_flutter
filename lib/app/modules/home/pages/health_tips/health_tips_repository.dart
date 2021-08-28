import 'package:covid19app/app/shared/custom_dio/custom_dio.dart';
import 'package:covid19app/app/shared/models/health_tips_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HealthTipsRepository extends Disposable {
  final CustomDio _dio;

  HealthTipsRepository(this._dio);

  Future fetchPost() async {
    final response = await _dio.client.get('/health-tips/list');
    return HealthTipsModel.fromJsonList(response.data);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
