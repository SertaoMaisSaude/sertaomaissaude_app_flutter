class CovidContactModel {
  int id;
  String description;
  bool active;

  CovidContactModel({
    this.id,
    this.description,
    this.active,
  });

  factory CovidContactModel.fromJson(Map<String, dynamic> json) =>
      CovidContactModel(
        id: json["id"],
        description: json["description"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "active": active,
      };

  static List<CovidContactModel> fromJsonList(List jsonList) {
    return jsonList.map((e) => CovidContactModel.fromJson(e)).toList();
  }

  @override
  bool operator ==(other) => other is CovidContactModel && other.id == this.id;

  @override
  int get hashCode =>
      super.hashCode ^ this.id.hashCode ^ this.description.hashCode;
}
