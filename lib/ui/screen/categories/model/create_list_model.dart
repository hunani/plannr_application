class CreateListModel {
  List<CreateListData> data;

  CreateListModel({
    required this.data,
  });

  factory CreateListModel.fromJson(Map<String, dynamic> json) =>
      CreateListModel(
        data: List<CreateListData>.from(
            json["data"].map((x) => CreateListData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CreateListData {
  int id;
  String name;
  String email;
  String mobileNumber;

  CreateListData({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
  });

  factory CreateListData.fromJson(Map<String, dynamic> json) => CreateListData(
        id: json["id"],
        name: json["Name"],
        email: json["Email"],
        mobileNumber: json["Mobile_Number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
        "Email": email,
        "Mobile_Number": mobileNumber,
      };
}
