class TarrotModel {
  String? name;
  String? image;
  String? answer;

  TarrotModel({this.name, this.image, this.answer});

  TarrotModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['answer'] = answer;
    return data;
  }
}
