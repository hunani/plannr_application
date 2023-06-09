class CreateInvitationSubmitDataModel {
  CreateInvitationSubmitData data;

  CreateInvitationSubmitDataModel({
    required this.data,
  });

  factory CreateInvitationSubmitDataModel.fromJson(Map<String, dynamic> json) =>
      CreateInvitationSubmitDataModel(
        data: CreateInvitationSubmitData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class CreateInvitationSubmitData {
  String image;
  String eventTitle;
  String startDate;
  String eventTime;
  String timeZone;
  String hostedBy;
  String phoneNumber;
  String location;
  String message;
  String typeOfEvent;
  String dressCode;
  String foodBeverages;
  String additionalInformation;
  String addAdditionalAdminEventOrganizer;
  String addChatRoom;
  String inviteMoreThan2People;

  CreateInvitationSubmitData({
    required this.image,
    required this.eventTitle,
    required this.startDate,
    required this.eventTime,
    required this.timeZone,
    required this.hostedBy,
    required this.phoneNumber,
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

  factory CreateInvitationSubmitData.fromJson(Map<String, dynamic> json) =>
      CreateInvitationSubmitData(
        image: json["image"],
        eventTitle: json["Event Title"],
        startDate: json["Start Date"],
        eventTime: json["Event Time"],
        timeZone: json["Time Zone"],
        hostedBy: json["Hosted By"],
        phoneNumber: json["Phone_number"],
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
        "Start Date": startDate,
        "Event Time": eventTime,
        "Time Zone": timeZone,
        "Hosted By": hostedBy,
        "Phone_number": phoneNumber,
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
