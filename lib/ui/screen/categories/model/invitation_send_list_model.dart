class InvitationSendListModel {
  List<InvitationSendList> data;

  InvitationSendListModel({
    required this.data,
  });

  factory InvitationSendListModel.fromJson(Map<String, dynamic> json) =>
      InvitationSendListModel(
        data: List<InvitationSendList>.from(
            json["data"].map((x) => InvitationSendList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class InvitationSendList {
  int id;
  String name;
  String mobileNumber;
  String email;

  InvitationSendList({
    required this.id,
    required this.name,
    required this.mobileNumber,
    required this.email,
  });

  factory InvitationSendList.fromJson(Map<String, dynamic> json) =>
      InvitationSendList(
        id: json["id"],
        name: json["name"],
        mobileNumber: json["mobile_number"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile_number": mobileNumber,
        "email": email,
      };
}
