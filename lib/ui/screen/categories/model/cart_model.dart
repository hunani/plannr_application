class CartList {
  int item;
  List<CartData> cartData;

  CartList({
    required this.item,
    required this.cartData,
  });

  factory CartList.fromJson(Map<String, dynamic> json) => CartList(
        item: json["item"] ?? 0,
        cartData: json["data"] == null
            ? []
            : List<CartData>.from(
                json["data"].map((x) => CartData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "item": item,
        "data": List<dynamic>.from(cartData.map((x) => x.toJson())),
      };
}

class CartData {
  int id;
  int categoryId;
  int colorId;
  int freeOrPremium;
  String productTitle;
  String image;
  String imagePath;

  CartData({
    required this.id,
    required this.categoryId,
    required this.colorId,
    required this.freeOrPremium,
    required this.productTitle,
    required this.image,
    required this.imagePath,
  });

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
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
