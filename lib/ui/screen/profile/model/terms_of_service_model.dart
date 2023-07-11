class TermsOfServiceModel {
  List<TermsOfServiceData> data;

  TermsOfServiceModel({
    required this.data,
  });

  factory TermsOfServiceModel.fromJson(Map<String, dynamic> json) =>
      TermsOfServiceModel(
        data: List<TermsOfServiceData>.from(
            json["data"].map((x) => TermsOfServiceData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TermsOfServiceData {
  String content;

  TermsOfServiceData({
    required this.content,
  });

  factory TermsOfServiceData.fromJson(Map<String, dynamic> json) =>
      TermsOfServiceData(
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
      };
}
