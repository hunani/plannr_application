class CreateModel {
  CreateList data;

  CreateModel({
    required this.data,
  });

  factory CreateModel.fromJson(Map<String, dynamic> json) => CreateModel(
        data: CreateList.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class CreateList {
  int id;
  String image;

  CreateList({
    required this.id,
    required this.image,
  });

  factory CreateList.fromJson(Map<String, dynamic> json) => CreateList(
        id: json["id"] ?? 0,
        image: json["image"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}
