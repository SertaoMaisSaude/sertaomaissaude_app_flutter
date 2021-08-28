import 'package:covid19app/app/shared/custom_dio/custom_dio.dart';
import 'package:covid19app/app/shared/models/analisy_model.dart';
import 'package:covid19app/app/shared/models/citizen_model.dart';
import 'package:covid19app/app/shared/models/covid_contact_model.dart';
import 'package:covid19app/app/shared/models/health_center_model.dart';
import 'package:covid19app/app/shared/models/result_cep_model.dart';
import 'package:covid19app/app/shared/models/risk_group_model.dart';
import 'package:covid19app/app/shared/models/sympton_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnalisyRepository extends Disposable {
  final CustomDio dio;

  AnalisyRepository(this.dio);

  Future<List<SymptonModel>> fetchSympton() async {
    final response = await dio.client.get('sympton/list/');
    return SymptonModel.fromJsonList(response.data);
  }

  Future<List<CovidContactModel>> fetchContacts() async {
    final response = await dio.client.get('covid-contact/list/');
    return CovidContactModel.fromJsonList(response.data);
  }

  Future<List<RiskGroupModel>> fetchRiskGroups() async {
    final response = await dio.client.get('risk-group/list/');
    return RiskGroupModel.fromJsonList(response.data);
  }

  Future fetchCep(String cep) async {
    final response =
        await dio.client.get('https://viacep.com.br/ws/$cep/json/');
    return ResultCep.fromJson(response.data);
  }

  Future<int> postCitizen(CitizenModel citizenModel) async {
    final response =
        await dio.client.post('citizen/create/', data: citizenModel.toJson());
    return response.data['id'];
  }

  Future postAnalisy(AnalisyModel analise) async {
    final response =
        await dio.client.post('/analisy/create/', data: analise.toJson());
    return response.data;
  }

  @override
  void dispose() {}
}
