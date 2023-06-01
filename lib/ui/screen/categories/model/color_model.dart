class ColorModel {
  List<ColorList> data;

  ColorModel({
    required this.data,
  });

  factory ColorModel.fromJson(Map<String, dynamic> json) => ColorModel(
        data: List<ColorList>.from(
            json["data"].map((x) => ColorList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ColorList {
  int id;
  String colorName;
  dynamic colorCode;

  ColorList({
    required this.id,
    required this.colorName,
    required this.colorCode,
  });

  factory ColorList.fromJson(Map<String, dynamic> json) => ColorList(
        id: json["id"],
        colorName: json["color_name"],
        colorCode: json["color_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "color_name": colorName,
        "color_code": colorCode,
      };
}
