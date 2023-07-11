class SubscriptionModel {
  List<SubscriptionList> data;

  SubscriptionModel({
    required this.data,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionModel(
        data: List<SubscriptionList>.from(
            json["data"].map((x) => SubscriptionList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SubscriptionList {
  String mainTitle;
  String monthPrice;
  String yearsPrice;
  String people;
  String unlimitedEvent;
  String addChatroom;
  String addUpToGuests;
  String accessToAllCurrent;

  SubscriptionList({
    required this.mainTitle,
    required this.monthPrice,
    required this.yearsPrice,
    required this.people,
    required this.unlimitedEvent,
    required this.addChatroom,
    required this.addUpToGuests,
    required this.accessToAllCurrent,
  });

  factory SubscriptionList.fromJson(Map<String, dynamic> json) =>
      SubscriptionList(
        mainTitle: json["main_title"],
        monthPrice: json["month_price"],
        yearsPrice: json["years_price"],
        people: json["people"],
        unlimitedEvent: json["unlimited_event"],
        addChatroom: json["add_chatroom"],
        addUpToGuests: json["add_up_to_guests"] ?? "null",
        accessToAllCurrent: json["access_to_all_current"],
      );

  Map<String, dynamic> toJson() => {
        "main_title": mainTitle,
        "month_price": monthPrice,
        "years_price": yearsPrice,
        "people": people,
        "unlimited_event": unlimitedEvent,
        "add_chatroom": addChatroom,
        "add_up_to_guests": addUpToGuests,
        "access_to_all_current": accessToAllCurrent,
      };
}
