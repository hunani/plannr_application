class FitterModel {
  List<FitterDataList> data;

  FitterModel({
    required this.data,
  });

  factory FitterModel.fromJson(Map<String, dynamic> json) => FitterModel(
        data: List<FitterDataList>.from(
            json["data"].map((x) => FitterDataList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FitterDataList {
  int id;
  int categoryId;
  int colorId;
  int freeOrPremium;
  String productTitle;
  String image;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  FitterDataList({
    required this.id,
    required this.categoryId,
    required this.colorId,
    required this.freeOrPremium,
    required this.productTitle,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FitterDataList.fromJson(Map<String, dynamic> json) => FitterDataList(
        id: json["id"],
        categoryId: json["category_id"],
        colorId: json["color_id"],
        freeOrPremium: json["free_or_premium"],
        productTitle: json["product_title"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "color_id": colorId,
        "free_or_premium": freeOrPremium,
        "product_title": productTitle,
        "image": image,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
