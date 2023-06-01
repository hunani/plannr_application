class CategoriesModel {
  List<CategoriesList> data;

  CategoriesModel({
    required this.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        data: List<CategoriesList>.from(
            json["data"].map((x) => CategoriesList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoriesList {
  int id;
  String name;
  String image;
  String imagePath;

  CategoriesList({
    required this.id,
    required this.name,
    required this.image,
    required this.imagePath,
  });

  factory CategoriesList.fromJson(Map<String, dynamic> json) => CategoriesList(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "image_path": imagePath,
      };
}
