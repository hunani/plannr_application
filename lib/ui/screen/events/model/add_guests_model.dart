class AddGustsModel {
  List<AddGustsList> data;

  AddGustsModel({
    required this.data,
  });

  factory AddGustsModel.fromJson(Map<String, dynamic> json) => AddGustsModel(
        data: List<AddGustsList>.from(
            json["data"].map((x) => AddGustsList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AddGustsList {
  int id;
  String name;
  String email;
  String mobileNumber;
  String select;

  AddGustsList({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.select,
  });

  factory AddGustsList.fromJson(Map<String, dynamic> json) => AddGustsList(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobileNumber: json["mobile_number"],
        select: json["select"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile_number": mobileNumber,
        "select": select,
      };
}
