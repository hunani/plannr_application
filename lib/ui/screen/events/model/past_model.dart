class PastModel {
  List<PastList> data;

  PastModel({
    required this.data,
  });

  factory PastModel.fromJson(Map<String, dynamic> json) => PastModel(
        data:
            List<PastList>.from(json["data"].map((x) => PastList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PastList {
  int id;
  String name;
  String phone;
  String date;
  String time;
  String hostedBy;
  String image;

  PastList({
    required this.id,
    required this.name,
    required this.phone,
    required this.date,
    required this.time,
    required this.hostedBy,
    required this.image,
  });

  factory PastList.fromJson(Map<String, dynamic> json) => PastList(
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
