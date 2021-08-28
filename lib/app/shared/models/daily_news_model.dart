import 'package:covid19app/app/shared/models/city_model.dart';

class DailyNewsModel {
  int id;
  DateTime date;
  DateTime datePublication;
  int discarded;
  int underInvestigation;
  int waitingExam;
  int confirmed;
  int recovered;
  int deaths;
  bool active;
  int homeIsolation;
  int hospitalStay;
  int testsCounty;
  int testsLacen;
  int testsPrivate;
  CityModel city;

  DailyNewsModel({
    this.id,
    this.date,
    this.datePublication,
    this.discarded,
    this.underInvestigation,
    this.waitingExam,
    this.confirmed,
    this.recovered,
    this.deaths,
    this.active,
    this.city,
    this.homeIsolation,
    this.hospitalStay,
    this.testsCounty,
    this.testsLacen,
    this.testsPrivate,
  });

  factory DailyNewsModel.fromJson(Map<String, dynamic> json) => DailyNewsModel(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        datePublication: DateTime.parse(json["date_publication"]),
        discarded: json["discarded"],
        underInvestigation: json["underInvestigation"],
        waitingExam: json["waiting_exam"],
        confirmed: json["confirmed"],
        recovered: json["recovered"],
        deaths: json["deaths"],
        active: json["active"],
        homeIsolation: json["homeIsolation"],
        hospitalStay: json["hospitalStay"],
        testsCounty: json["testsCounty"],
        testsLacen: json["testsLacen"],
        testsPrivate: json["testsPrivate"],
        city: CityModel.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "date_publication": datePublication.toIso8601String(),
        "discarded": discarded,
        "underInvestigation": underInvestigation,
        "waiting_exam": waitingExam,
        "confirmed": confirmed,
        "recovered": recovered,
        "deaths": deaths,
        "active": active,
        "city": city.toJson(),
      };

  static List<DailyNewsModel> fromJsonList(List jsonList) {
    return jsonList.map((e) => DailyNewsModel.fromJson(e)).toList();
  }
}
