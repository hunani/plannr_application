class RsvpCountModel {
  List<RsvpCountList> data;

  RsvpCountModel({
    required this.data,
  });

  factory RsvpCountModel.fromJson(Map<String, dynamic> json) => RsvpCountModel(
        data: List<RsvpCountList>.from(
            json["data"].map((x) => RsvpCountList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class RsvpCountList {
  int attending;
  int notAttending;
  int panding;

  RsvpCountList({
    required this.attending,
    required this.notAttending,
    required this.panding,
  });

  factory RsvpCountList.fromJson(Map<String, dynamic> json) => RsvpCountList(
        attending: json["Attending"],
        notAttending: json["Not Attending"],
        panding: json["panding"],
      );

  Map<String, dynamic> toJson() => {
        "Attending": attending,
        "Not Attending": notAttending,
        "panding": panding,
      };
}
