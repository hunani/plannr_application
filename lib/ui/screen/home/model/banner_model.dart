class BannerModel {
  List<BannerList> data;

  BannerModel({
    required this.data,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        data: List<BannerList>.from(
            json["data"].map((x) => BannerList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BannerList {
  int id;
  String image;
  String imagePath;

  BannerList({
    required this.id,
    required this.image,
    required this.imagePath,
  });

  factory BannerList.fromJson(Map<String, dynamic> json) => BannerList(
        id: json["id"],
        image: json["image"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "image_path": imagePath,
      };
}
