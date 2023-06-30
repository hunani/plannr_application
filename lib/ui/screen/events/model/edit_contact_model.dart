// class EventOverviewModel {
//   List<EventOverviewList> data;
//
//   EventOverviewModel({
//     required this.data,
//   });
//
//   factory EventOverviewModel.fromJson(Map<String, dynamic> json) =>
//       EventOverviewModel(
//         data: List<EventOverviewList>.from(
//             json["data"].map((x) => EventOverviewList.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }
//
// class EventOverviewList {
//   int id;
//   String name;
//   String phone;
//   DateTime date;
//   String time;
//   String hostedBy;
//   String image;
//
//   EventOverviewList({
//     required this.id,
//     required this.name,
//     required this.phone,
//     required this.date,
//     required this.time,
//     required this.hostedBy,
//     required this.image,
//   });
//
//   factory EventOverviewList.fromJson(Map<String, dynamic> json) =>
//       EventOverviewList(
//         id: json["id"],
//         name: json["Name"],
//         phone: json["Phone"],
//         date: DateTime.parse(json["Date"]),
//         time: json["Time"],
//         hostedBy: json["Hosted_By"],
//         image: json["Image"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "Name": name,
//         "Phone": phone,
//         "Date":
//             "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
//         "Time": time,
//         "Hosted_By": hostedBy,
//         "Image": image,
//       };
// }

class EventOverviewModel {
  List<EventOverviewList> data;

  EventOverviewModel({
    required this.data,
  });

  factory EventOverviewModel.fromJson(Map<String, dynamic> json) =>
      EventOverviewModel(
        data: List<EventOverviewList>.from(
            json["data"].map((x) => EventOverviewList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class EventOverviewList {
  int id;
  String name;
  String phone;
  String date;
  String time;
  String hostedBy;
  String image;

  EventOverviewList({
    required this.id,
    required this.name,
    required this.phone,
    required this.date,
    required this.time,
    required this.hostedBy,
    required this.image,
  });

  factory EventOverviewList.fromJson(Map<String, dynamic> json) =>
      EventOverviewList(
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
