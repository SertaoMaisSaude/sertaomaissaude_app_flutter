import 'package:covid19app/app/shared/models/covid_contact_model.dart';
import 'package:covid19app/app/shared/models/sympton_model.dart';

class AnalisyModel {
  int id;
  DateTime date;
  bool hasFaver;
  double fever;
  int citizen;
  double lat;
  double lng;
  CovidContactModel covidContact;
  List<SymptonModel> listSympton;
  String otherSympton;

  AnalisyModel({
    this.id,
    this.date,
    this.hasFaver,
    this.fever,
    this.citizen,
    this.covidContact,
    this.lat,
    this.lng,
    this.listSympton,
    this.otherSympton,
  });

  AnalisyModel copyWith(
    int id,
    DateTime date,
    bool hasFaver,
    double fever,
    int citizen,
    double lat,
    double lng,
    CovidContactModel covidContact,
    List<SymptonModel> listSympton,
    String otherSympton,
  ) {
    return AnalisyModel(
      id: id ?? this.id,
      date: date ?? this.date,
      hasFaver: hasFaver ?? this.hasFaver,
      citizen: citizen ?? this.citizen,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      covidContact: covidContact ?? this.covidContact,
      listSympton: this.listSympton ?? this.listSympton,
      otherSympton: otherSympton ?? this.otherSympton,
    );
  }

  factory AnalisyModel.fromJson(Map<String, dynamic> json) => AnalisyModel(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        hasFaver: json["has_faver"],
        fever: json["fever"],
        citizen: json["citizen"]['id'],
        covidContact: CovidContactModel.fromJson(json["covidContact"]),
        lat: json['lat'],
        lng: json['lng'],
        listSympton: List<dynamic>.from(json["listSympton"].map((x) => x)),
        otherSympton: json['otherSympton']
    );

  Map<String, dynamic> toJson() {
    if (lat != null && lng != null) {
      return {
        "date": date.toIso8601String(),
        "has_faver": hasFaver,
        "fever": fever,
        "citizen": citizen,
        "covidContact": covidContact.id,
        "lat": lat,
        "lng": lng,
        "listSympton": listSympton.map((x) => x.id).toList(),
        "otherSympton": otherSympton,
      };
    } else {
      return {
        "date": date.toIso8601String(),
        "has_faver": hasFaver,
        "fever": fever,
        "citizen": citizen,
        "covidContact": covidContact.id,
        "listSympton": listSympton.map((x) => x.id).toList(),
        "otherSympton": otherSympton,
      };
    }
  }
}
