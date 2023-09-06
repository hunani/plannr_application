class GuestListYesNoModel {
  List<GuestListYesNoList> data;

  GuestListYesNoModel({
    required this.data,
  });

  factory GuestListYesNoModel.fromJson(Map<String, dynamic> json) =>
      GuestListYesNoModel(
        data: List<GuestListYesNoList>.from(
            json["data"].map((x) => GuestListYesNoList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GuestListYesNoList {
  int id;
  String name;
  String email;
  String mobileNumber;
  String status;

  GuestListYesNoList({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.status,
  });

  factory GuestListYesNoList.fromJson(Map<String, dynamic> json) =>
      GuestListYesNoList(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobileNumber: json["mobile_number"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile_number": mobileNumber,
        "status": status,
      };
}
