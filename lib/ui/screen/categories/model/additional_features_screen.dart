class AdditionalFeaturesModel {
  List<AdditionalFeaturesData> data;

  AdditionalFeaturesModel({
    required this.data,
  });

  factory AdditionalFeaturesModel.fromJson(Map<String, dynamic> json) =>
      AdditionalFeaturesModel(
        data: List<AdditionalFeaturesData>.from(
            json["data"].map((x) => AdditionalFeaturesData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AdditionalFeaturesData {
  String title;
  int price;

  AdditionalFeaturesData({
    required this.title,
    required this.price,
  });

  factory AdditionalFeaturesData.fromJson(Map<String, dynamic> json) =>
      AdditionalFeaturesData(
        title: json["title"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
      };
}
