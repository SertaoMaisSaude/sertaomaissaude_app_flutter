class SymptonModel {
  int id;
  String name;
  String description;

  SymptonModel({
    this.id,
    this.name,
    this.description,
  });

  factory SymptonModel.fromJson(Map<String, dynamic> json) => SymptonModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };

  static List<SymptonModel> fromJsonList(List jsonList) {
    return jsonList.map((e) => SymptonModel.fromJson(e)).toList();
  }

  @override
  bool operator ==(other) => other is SymptonModel && other.id == this.id;

  @override
  int get hashCode =>
      super.hashCode ^
      this.id.hashCode ^
      this.description.hashCode ^
      this.name.hashCode;
}
