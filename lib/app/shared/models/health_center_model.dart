class HealthCenterModel {
  int id;
  String name;
  String neighborhood;
  String streetNumber;
  String street;
  String phone;
  double lat;
  double long;

  HealthCenterModel(
      {this.id,
      this.name,
      this.neighborhood,
      this.street,
      this.streetNumber,
      this.phone,
      this.long,
      this.lat});

  factory HealthCenterModel.fromJson(Map<String, dynamic> json) =>
      HealthCenterModel(
        id: json['id'],
        name: json['name'],
        neighborhood: json['neighborhood'],
        street: json['street'],
        streetNumber: json['streetNumber'],
        phone: json['phone'],
        lat: json['lat'],
      );

  static List<HealthCenterModel> fromJsonList(List jsonList) =>
      jsonList.map((e) => HealthCenterModel.fromJson(e)).toList();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is HealthCenterModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              long == other.long &&
              lat == other.lat;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      neighborhood.hashCode ^
      streetNumber.hashCode ^
      street.hashCode ^
      phone.hashCode ^
      lat.hashCode ^
      long.hashCode;



}
