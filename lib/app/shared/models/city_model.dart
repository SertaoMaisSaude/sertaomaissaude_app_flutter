class CityModel {
  int id;
  String code;
  String name;
  double latLng;

  CityModel({this.id, this.code, this.name, this.latLng});

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json['id'],
        code: json['code'],
        name: json['name'],
        latLng: json['lat'],
      );

  static List<CityModel> fromJsonList(List jsonList) {
    return jsonList.map((e) => CityModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['latLng'] = this.latLng;
    return data;
  }
}
