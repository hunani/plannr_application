// class BirtdayPartyModel {
//   List<BirtdayPartyList> data;
//
//   BirtdayPartyModel({
//     required this.data,
//   });
//
//   factory BirtdayPartyModel.fromJson(Map<String, dynamic> json) =>
//       BirtdayPartyModel(
//         data: List<BirtdayPartyList>.from(
//             json["data"].map((x) => BirtdayPartyList.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }
//
// class BirtdayPartyList {
//   int id;
//   String image;
//   String imagePath;
//
//   BirtdayPartyList({
//     required this.id,
//     required this.image,
//     required this.imagePath,
//   });
//
//   factory BirtdayPartyList.fromJson(Map<String, dynamic> json) =>
//       BirtdayPartyList(
//         id: json["id"],
//         image: json["image"],
//         imagePath: json["image_path"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "image": image,
//         "image_path": imagePath,
//       };
// }

class BirtdayPartyModel {
  List<BirtdayPartyList> data;

  BirtdayPartyModel({
    required this.data,
  });

  factory BirtdayPartyModel.fromJson(Map<String, dynamic> json) =>
      BirtdayPartyModel(
        data: List<BirtdayPartyList>.from(
            json["data"].map((x) => BirtdayPartyList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BirtdayPartyList {
  String catName;
  List<CatProduct> catProduct;

  BirtdayPartyList({
    required this.catName,
    required this.catProduct,
  });

  factory BirtdayPartyList.fromJson(Map<String, dynamic> json) =>
      BirtdayPartyList(
        catName: json["cat_name"],
        catProduct: List<CatProduct>.from(
            json["cat_product"].map((x) => CatProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cat_name": catName,
        "cat_product": List<dynamic>.from(catProduct.map((x) => x.toJson())),
      };
}

class CatProduct {
  int id;
  String productTitle;
  String image;
  String imagePath;

  CatProduct({
    required this.id,
    required this.productTitle,
    required this.image,
    required this.imagePath,
  });

  factory CatProduct.fromJson(Map<String, dynamic> json) => CatProduct(
        id: json["id"],
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
