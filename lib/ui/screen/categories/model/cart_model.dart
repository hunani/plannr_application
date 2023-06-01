class CartModel {
  List<CartList> data;

  CartModel({
    required this.data,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        data:
            List<CartList>.from(json["data"].map((x) => CartList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CartList {
  int id;
  String productTitle;
  int freeOrPremium;
  String categoryName;
  String image;
  String colorName;
  String imagePath;

  CartList({
    required this.id,
    required this.productTitle,
    required this.freeOrPremium,
    required this.categoryName,
    required this.image,
    required this.colorName,
    required this.imagePath,
  });

  factory CartList.fromJson(Map<String, dynamic> json) => CartList(
        id: json["id"],
        productTitle: json["product_title"],
        freeOrPremium: json["free_or_premium"],
        categoryName: json["category_name"],
        image: json["image"],
        colorName: json["color_name"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_title": productTitle,
        "free_or_premium": freeOrPremium,
        "category_name": categoryName,
        "image": image,
        "color_name": colorName,
        "image_path": imagePath,
      };
}
