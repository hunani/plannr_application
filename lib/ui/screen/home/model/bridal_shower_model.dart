class BirdalShowerModel {
  String catName;
  List<BirdalShowerList> catProduct;

  BirdalShowerModel({
    required this.catName,
    required this.catProduct,
  });

  factory BirdalShowerModel.fromJson(Map<String, dynamic> json) =>
      BirdalShowerModel(
        catName: json["cat_name"],
        catProduct: List<BirdalShowerList>.from(
            json["cat_product"].map((x) => BirdalShowerList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cat_name": catName,
        "cat_product": List<dynamic>.from(catProduct.map((x) => x.toJson())),
      };
}

class BirdalShowerList {
  int id;
  String productTitle;
  String image;
  String imagePath;

  BirdalShowerList({
    required this.id,
    required this.productTitle,
    required this.image,
    required this.imagePath,
  });

  factory BirdalShowerList.fromJson(Map<String, dynamic> json) =>
      BirdalShowerList(
        id: json["id"] ?? "",
        productTitle: json["product_title"],
        image: json["image"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_title": productTitle,
        "image": image,
        "image_path": imagePath,
      };
}
