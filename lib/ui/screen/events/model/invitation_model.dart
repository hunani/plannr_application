class InvitationModel {
  InvitationList data;

  InvitationModel({
    required this.data,
  });

  factory InvitationModel.fromJson(Map<String, dynamic> json) =>
      InvitationModel(
        data: InvitationList.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class InvitationList {
  String image;
  String eventTitle;
  String startDate;
  String eventTime;
  String timeZone;
  String hostedBy;
  String location;
  String phoneNumber;
  String message;
  String typeOfEvent;
  String dressCode;
  String foodBeverages;
  String additionalInformation;
  String addAdditionalAdminEventOrganizer;
  String addChatRoom;
  String inviteMoreThan2People;

  InvitationList({
    required this.image,
    required this.eventTitle,
    required this.startDate,
    required this.eventTime,
    required this.timeZone,
    required this.hostedBy,
    required this.location,
    required this.phoneNumber,
    required this.message,
    required this.typeOfEvent,
    required this.dressCode,
    required this.foodBeverages,
    required this.additionalInformation,
    required this.addAdditionalAdminEventOrganizer,
    required this.addChatRoom,
    required this.inviteMoreThan2People,
  });

  factory InvitationList.fromJson(Map<String, dynamic> json) => InvitationList(
        image: json["image"] ?? "",
        eventTitle: json["Event Title"] ?? "",
        startDate: json["Start Date"] ?? "",
        eventTime: json["Event Time"] ?? "",
        timeZone: json["Time Zone"] ?? "",
        hostedBy: json["Hosted By"] ?? "",
        location: json["Location"] ?? "",
        phoneNumber: json["Phone_number"] ?? "",
        message: json["message"] ?? "",
        typeOfEvent: json["Type of Event"] ?? "",
        dressCode: json["Dress Code"] ?? "",
        foodBeverages: json["Food / Beverages"] ?? "",
        additionalInformation: json["Additional Information"] ?? "",
        addAdditionalAdminEventOrganizer:
            json["Add Additional Admin / Event Organizer"] ?? '',
        addChatRoom: json["Add Chat Room"] ?? '',
        inviteMoreThan2People: json["Invite More Than 2 People"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "Event Title": eventTitle,
        "Start Date": startDate,
        "Event Time": eventTime,
        "Time Zone": timeZone,
        "Hosted By": hostedBy,
        "Location": location,
        "Phone_number": phoneNumber,
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
