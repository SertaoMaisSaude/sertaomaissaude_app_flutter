class RiskGroupModel {
  int id;
  String name;

  RiskGroupModel({
    this.id,
    this.name,
  });

  factory RiskGroupModel.fromJson(Map<String, dynamic> json) => RiskGroupModel(
        name: json["name"],
        id: json['id'],
      );

  static List<RiskGroupModel> fromJsonList(List jsonList) {
    return jsonList.map((e) => RiskGroupModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() => {"name": name, "id": id};
  @override
  bool operator ==(other) => other is RiskGroupModel && other.id == this.id;

  @override
  int get hashCode => super.hashCode ^ this.id.hashCode ^ this.name.hashCode;
}
