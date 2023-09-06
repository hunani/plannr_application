class EditInvitationModel {
  EditInvitationData data;

  EditInvitationModel({
    required this.data,
  });

  factory EditInvitationModel.fromJson(Map<String, dynamic> json) =>
      EditInvitationModel(
        data: EditInvitationData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class EditInvitationData {
  int id;
  int productId;
  int userId;
  String customImage;
  String name;
  String time;
  String date;
  String zone;
  String location;
  String phone;
  String message;
  String typeEvents;
  String dressCode;
  String food;
  String addInfo;
  String addAdmin;
  String addChatRoom;
  String inviteMore;
  String hostedBy;
  String draft;
  DateTime createdAt;
  DateTime updatedAt;

  EditInvitationData({
    required this.id,
    required this.productId,
    required this.userId,
    required this.customImage,
    required this.name,
    required this.time,
    required this.date,
    required this.zone,
    required this.location,
    required this.phone,
    required this.message,
    required this.typeEvents,
    required this.dressCode,
    required this.food,
    required this.addInfo,
    required this.addAdmin,
    required this.addChatRoom,
    required this.inviteMore,
    required this.hostedBy,
    required this.draft,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EditInvitationData.fromJson(Map<String, dynamic> json) =>
      EditInvitationData(
        id: json["id"],
        productId: json["product_id"],
        userId: json["user_id"],
        customImage: json["custom_image"] ?? "",
        name: json["name"] ?? "",
        time: json["time"] ?? "null",
        date: json["date"] ?? "null",
        zone: json["zone"] ?? "null",
        location: json["location"] ?? "null",
        phone: json["phone"] ?? "null",
        message: json["message"] ?? "null",
        typeEvents: json["type_events"] ?? "null",
        dressCode: json["dress_code"] ?? "null",
        food: json["food"] ?? "null",
        addInfo: json["add_info"] ?? "null",
        addAdmin: json["add_admin"] ?? "null",
        addChatRoom: json["add_chat_room"] ?? "null",
        inviteMore: json["invite_more"] ?? "null",
        hostedBy: json["hosted_by"] ?? "null",
        draft: json["draft"] ?? "null",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "user_id": userId,
        "custom_image": customImage,
        "name": name,
        "time": time,
        "date": date,
        "zone": zone,
        "location": location,
        "phone": phone,
        "message": message,
        "type_events": typeEvents,
        "dress_code": dressCode,
        "food": food,
        "add_info": addInfo,
        "add_admin": addAdmin,
        "add_chat_room": addChatRoom,
        "invite_more": inviteMore,
        "hosted_by": hostedBy,
        "draft": draft,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
