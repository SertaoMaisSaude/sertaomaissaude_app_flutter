import 'package:covid19app/app/shared/models/risk_group_model.dart';
import 'package:flutter/foundation.dart';

class CitizenModel {
  int id;
  List<RiskGroupModel> listRiskGroup;
  String otherRiskGroup;
  String name;
  String phoneNumber;
  int age;
  String cep;
  String sex;
  String street;
  String streetNumber;
  String neighbordhood;
  int healthCenter;

  CitizenModel(
      {this.id,
      @required this.listRiskGroup,
      @required this.otherRiskGroup,
      this.name,
      @required this.phoneNumber,
      @required this.age,
      @required this.sex,
      this.cep,
      this.street,
      this.streetNumber,
      this.neighbordhood,
      this.healthCenter});

  factory CitizenModel.fromJson(Map<String, dynamic> json) => CitizenModel(
        id: json['id'],
        listRiskGroup: RiskGroupModel.fromJsonList(json['riskGroup']),
        otherRiskGroup: json['otherRiskGroup'],
        name: json['name'],
        sex: json['sex'],
        phoneNumber: json['PhoneNumber'],
        age: json['age'],
        cep: json['cep'],
        street: json['street'],
        streetNumber: json['street_number'],
        neighbordhood: json['neighborhood'],
        healthCenter: json['healthCenter']
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "otherRiskGroup": otherRiskGroup,
        "name": name,
        "phoneNumber": phoneNumber,
        "cep": cep,
        "age": age,
        "sex": sex,
        "listRiskGroup": listRiskGroup.map((e) => e.id).toList(),
        "street": street,
        "street_number": streetNumber,
        "neighborhood": neighbordhood,
        "healthCenter": healthCenter
      };
  static List<CitizenModel> fromJsonList(List json) {
    return json.map((e) => CitizenModel.fromJson(e)).toList();
  }
}
