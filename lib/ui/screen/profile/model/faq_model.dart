class FaqModel {
  List<FaqList> data;

  FaqModel({
    required this.data,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
        data: List<FaqList>.from(json["data"].map((x) => FaqList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FaqList {
  String title;
  String description;
  String view;

  FaqList({
    required this.title,
    required this.description,
    required this.view,
  });

  factory FaqList.fromJson(Map<String, dynamic> json) => FaqList(
        title: json["title"],
        description: json["description"],
        view: json["view"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "view": view,
      };
}
