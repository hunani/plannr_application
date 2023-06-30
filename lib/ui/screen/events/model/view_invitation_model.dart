class ViewInvitatioModel {
  ViewInvitatioData data;

  ViewInvitatioModel({
    required this.data,
  });

  factory ViewInvitatioModel.fromJson(Map<String, dynamic> json) =>
      ViewInvitatioModel(
        data: ViewInvitatioData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class ViewInvitatioData {
  String image;
  String typeOfEvent;
  String startDate;
  String eventTime;
  String location;
  String hostedBy;
  String phoneNumber;
  String eventTitle;

  ViewInvitatioData({
    required this.image,
    required this.typeOfEvent,
    required this.startDate,
    required this.eventTime,
    required this.location,
    required this.hostedBy,
    required this.phoneNumber,
    required this.eventTitle,
  });

  factory ViewInvitatioData.fromJson(Map<String, dynamic> json) =>
      ViewInvitatioData(
        image: json["image"],
        typeOfEvent: json["Type of Event"],
        startDate: json["Start Date"],
        eventTime: json["Event Time"],
        location: json["Location"],
        hostedBy: json["Hosted By"],
        phoneNumber: json["Phone_number"],
        eventTitle: json["Event Title"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "Type of Event": typeOfEvent,
        "Start Date": startDate,
        "Event Time": eventTime,
        "Location": location,
        "Hosted By": hostedBy,
        "Phone_number": phoneNumber,
        "Event Title": eventTitle,
      };
}
