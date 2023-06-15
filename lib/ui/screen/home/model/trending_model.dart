class TrendingBannerModel {
  List<TrendingBannerList> data;

  TrendingBannerModel({
    required this.data,
  });

  factory TrendingBannerModel.fromJson(Map<String, dynamic> json) =>
      TrendingBannerModel(
        data: List<TrendingBannerList>.from(
            json["data"].map((x) => TrendingBannerList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TrendingBannerList {
  int id;
  String title;
  String image;
  String imagePath;

  TrendingBannerList({
    required this.id,
    required this.title,
    required this.image,
    required this.imagePath,
  });

  factory TrendingBannerList.fromJson(Map<String, dynamic> json) =>
      TrendingBannerList(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "image_path": imagePath,
      };
}
