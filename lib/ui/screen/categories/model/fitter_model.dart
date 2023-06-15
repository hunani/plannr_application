class FitterModel {
  int item;
  List<FitterList> fitter;

  FitterModel({
    required this.item,
    required this.fitter,
  });

  factory FitterModel.fromJson(Map<String, dynamic> json) => FitterModel(
        item: json["item"] ?? 0,
        fitter: json["data"] == null
            ? []
            : List<FitterList>.from(
                json["data"].map((x) => FitterList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "item": item,
        "data": List<dynamic>.from(fitter.map((x) => x.toJson())),
      };
}

class FitterList {
  int id;
  int categoryId;
  int colorId;
  int freeOrPremium;
  String productTitle;
  String image;
  String imagePath;

  FitterList({
    required this.id,
    required this.categoryId,
    required this.colorId,
    required this.freeOrPremium,
    required this.productTitle,
    required this.image,
    required this.imagePath,
  });

  factory FitterList.fromJson(Map<String, dynamic> json) => FitterList(
        id: json["id"],
        categoryId: json["category_id"],
        colorId: json["color_id"],
        freeOrPremium: json["free_or_premium"],
        productTitle: json["product_title"],
        image: json["image"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "color_id": colorId,
        "free_or_premium": freeOrPremium,
        "product_title": productTitle,
        "image": image,
        "image_path": imagePath,
      };
}
