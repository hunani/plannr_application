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
  String eventTitle;
  DateTime startDate;
  String eventTime;
  String timeZone;
  String hostedBy;
  String location;
  String message;
  String typeOfEvent;
  String dressCode;
  String foodBeverages;
  String additionalInformation;
  String addAdditionalAdminEventOrganizer;
  String addChatRoom;
  String inviteMoreThan2People;

  ViewInvitatioData({
    required this.image,
    required this.eventTitle,
    required this.startDate,
    required this.eventTime,
    required this.timeZone,
    required this.hostedBy,
    required this.location,
    required this.message,
    required this.typeOfEvent,
    required this.dressCode,
    required this.foodBeverages,
    required this.additionalInformation,
    required this.addAdditionalAdminEventOrganizer,
    required this.addChatRoom,
    required this.inviteMoreThan2People,
  });

  factory ViewInvitatioData.fromJson(Map<String, dynamic> json) =>
      ViewInvitatioData(
        image: json["image"],
        eventTitle: json["Event Title"],
        startDate: DateTime.parse(json["Start Date"]),
        eventTime: json["Event Time"],
        timeZone: json["Time Zone"],
        hostedBy: json["Hosted By"],
        location: json["Location"],
        message: json["message"],
        typeOfEvent: json["Type of Event"],
        dressCode: json["Dress Code"],
        foodBeverages: json["Food / Beverages"],
        additionalInformation: json["Additional Information"],
        addAdditionalAdminEventOrganizer:
            json["Add Additional Admin / Event Organizer"],
        addChatRoom: json["Add Chat Room"],
        inviteMoreThan2People: json["Invite More Than 2 People"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "Event Title": eventTitle,
        "Start Date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "Event Time": eventTime,
        "Time Zone": timeZone,
        "Hosted By": hostedBy,
        "Location": location,
        "message": message,
        "Type of Event": typeOfEvent,
        "Dress Code": dressCode,
        "Food / Beverages": foodBeverages,
        "Additional Information": additionalInformation,
        "Add Additional Admin / Event Organizer":
            addAdditionalAdminEventOrganizer,
        "Add Chat Room": addChatRoom,
        "Invite More Than 2 People": inviteMoreThan2People,
      };
}
