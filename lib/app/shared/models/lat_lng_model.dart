class LatLngModel {
  int id;
  String lat;
  String lng;

  LatLngModel({
    this.id,
    this.lat,
    this.lng,
  });

  factory LatLngModel.fromJson(Map<String, dynamic> json) => LatLngModel(
        id: json["id"],
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lat": lat,
        "lng": lng,
      };
}
