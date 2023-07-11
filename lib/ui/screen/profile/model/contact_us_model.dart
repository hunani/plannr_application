class ContactUsModel {
  List<ContactUsData> data;

  ContactUsModel({
    required this.data,
  });

  factory ContactUsModel.fromJson(Map<String, dynamic> json) => ContactUsModel(
        data: List<ContactUsData>.from(
            json["data"].map((x) => ContactUsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ContactUsData {
  String content;

  ContactUsData({
    required this.content,
  });

  factory ContactUsData.fromJson(Map<String, dynamic> json) => ContactUsData(
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
      };
}
