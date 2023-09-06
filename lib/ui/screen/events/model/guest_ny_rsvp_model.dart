class GuestByRsvpModel {
  List<GuestByRsvpList> data;

  GuestByRsvpModel({
    required this.data,
  });

  factory GuestByRsvpModel.fromJson(Map<String, dynamic> json) =>
      GuestByRsvpModel(
        data: List<GuestByRsvpList>.from(
            json["data"].map((x) => GuestByRsvpList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GuestByRsvpList {
  String all;
  int yes;
  int no;
  int maybe;
  int panding;

  GuestByRsvpList({
    required this.all,
    required this.yes,
    required this.no,
    required this.maybe,
    required this.panding,
  });

  factory GuestByRsvpList.fromJson(Map<String, dynamic> json) =>
      GuestByRsvpList(
        all: json["all"] ?? "0",
        yes: json["Yes"] ?? 0,
        no: json["No"] ?? 0,
        maybe: json["maybe"] ?? 0,
        panding: json["panding"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "all": all,
        "Yes": yes,
        "No": no,
        "maybe": maybe,
        "panding": panding,
      };
}
