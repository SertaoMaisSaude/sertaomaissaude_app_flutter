class HealthTipsModel {
  int id;
  String title;
  String photo;
  String body;

  HealthTipsModel({this.id, this.title, this.photo, this.body});

  factory HealthTipsModel.fromJson(Map<String, dynamic> json) {
    return HealthTipsModel(
      id: json['id'],
      title: json['title'],
      photo: json['photo'],
      body: json['body'],
    );
  }

  static List<HealthTipsModel> fromJsonList(List jsonList) {
    return jsonList.map((e) => HealthTipsModel.fromJson(e)).toList();
  }
}
