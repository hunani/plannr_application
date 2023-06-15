class UpcomingModel {
  List<UpcomingList> data;

  UpcomingModel({
    required this.data,
  });

  factory UpcomingModel.fromJson(Map<String, dynamic> json) => UpcomingModel(
        data: List<UpcomingList>.from(
            json["data"].map((x) => UpcomingList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class UpcomingList {
  int id;
  String name;
  String phone;
  String date;
  String time;
  String hostedBy;
  String image;

  UpcomingList({
    required this.id,
    required this.name,
    required this.phone,
    required this.date,
    required this.time,
    required this.hostedBy,
    required this.image,
  });

  factory UpcomingList.fromJson(Map<String, dynamic> json) => UpcomingList(
        id: json["id"],
        name: json["Name"],
        phone: json["Phone"],
        date: json["Date"],
        time: json["Time"],
        hostedBy: json["Hosted_By"],
        image: json["Image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
        "Phone": phone,
        "Date": date,
        "Time": time,
        "Hosted_By": hostedBy,
        "Image": image,
      };
}
