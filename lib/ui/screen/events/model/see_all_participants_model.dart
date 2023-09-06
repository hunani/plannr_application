class SeeAllParticipantsModel {
  List<SeeAllParticipantsList> data;

  SeeAllParticipantsModel({
    required this.data,
  });

  factory SeeAllParticipantsModel.fromJson(Map<String, dynamic> json) =>
      SeeAllParticipantsModel(
        data: List<SeeAllParticipantsList>.from(
            json["data"].map((x) => SeeAllParticipantsList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SeeAllParticipantsList {
  int id;
  String name;
  String mobileNumber;
  String email;

  SeeAllParticipantsList({
    required this.id,
    required this.name,
    required this.mobileNumber,
    required this.email,
  });

  factory SeeAllParticipantsList.fromJson(Map<String, dynamic> json) =>
      SeeAllParticipantsList(
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
