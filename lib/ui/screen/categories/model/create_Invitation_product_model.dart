// class CreateInvitationProductModel {
//   CreateInvitationProductList data;
//
//   CreateInvitationProductModel({
//     required this.data,
//   });
//
//   factory CreateInvitationProductModel.fromJson(Map<String, dynamic> json) =>
//       CreateInvitationProductModel(
//         data: CreateInvitationProductList.fromJson(json["data"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "data": data.toJson(),
//       };
// }
//
// class CreateInvitationProductList {
//   String name;
//   String date;
//   String zone;
//   String time;
//   String location;
//   String phone;
//   String typeEvents;
//   String dressCode;
//   String food;
//   String addInfo;
//   String addAdmin;
//   String addChatRoom;
//   String inviteMore;
//   String hostedBy;
//   int productId;
//   String message;
//   dynamic userId;
//   String customImage;
//   String draft;
//   DateTime updatedAt;
//   DateTime createdAt;
//   int id;
//
//   CreateInvitationProductList({
//     required this.name,
//     required this.date,
//     required this.zone,
//     required this.time,
//     required this.location,
//     required this.phone,
//     required this.typeEvents,
//     required this.dressCode,
//     required this.food,
//     required this.addInfo,
//     required this.addAdmin,
//     required this.addChatRoom,
//     required this.inviteMore,
//     required this.hostedBy,
//     required this.productId,
//     required this.message,
//     this.userId,
//     required this.customImage,
//     required this.draft,
//     required this.updatedAt,
//     required this.createdAt,
//     required this.id,
//   });
//
//   factory CreateInvitationProductList.fromJson(Map<String, dynamic> json) =>
//       CreateInvitationProductList(
//         name: json["name"],
//         date: json["date"],
//         zone: json["zone"],
//         time: json["time"],
//         location: json["location"],
//         phone: json["phone"],
//         typeEvents: json["type_events"],
//         dressCode: json["dress_code"],
//         food: json["food"],
//         addInfo: json["add_info"],
//         addAdmin: json["add_admin"],
//         addChatRoom: json["add_chat_room"],
//         inviteMore: json["invite_more"],
//         hostedBy: json["hosted_by"],
//         productId: json["product_id"],
//         message: json["message"],
//         userId: json["user_id"],
//         customImage: json["custom_image"],
//         draft: json["draft"],
//         updatedAt: DateTime.parse(json["updated_at"]),
//         createdAt: DateTime.parse(json["created_at"]),
//         id: json["id"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "date": date,
//         "zone": zone,
//         "time": time,
//         "location": location,
//         "phone": phone,
//         "type_events": typeEvents,
//         "dress_code": dressCode,
//         "food": food,
//         "add_info": addInfo,
//         "add_admin": addAdmin,
//         "add_chat_room": addChatRoom,
//         "invite_more": inviteMore,
//         "hosted_by": hostedBy,
//         "product_id": productId,
//         "message": message,
//         "user_id": userId,
//         "custom_image": customImage,
//         "draft": draft,
//         "updated_at": updatedAt.toIso8601String(),
//         "created_at": createdAt.toIso8601String(),
//         "id": id,
//       };
// }

class CreateInvitationProductModel {
  CreateInvitationProductList data;

  CreateInvitationProductModel({
    required this.data,
  });

  factory CreateInvitationProductModel.fromJson(Map<String, dynamic> json) =>
      CreateInvitationProductModel(
        data: CreateInvitationProductList.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class CreateInvitationProductList {
  String name;
  DateTime date;
  String zone;
  String time;
  String location;
  String phone;
  String typeEvents;
  String dressCode;
  String food;
  String addInfo;
  String addAdmin;
  String addChatRoom;
  String inviteMore;
  String hostedBy;
  String productId;
  String message;
  String userId;
  String customImage;
  String draft;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  CreateInvitationProductList({
    required this.name,
    required this.date,
    required this.zone,
    required this.time,
    required this.location,
    required this.phone,
    required this.typeEvents,
    required this.dressCode,
    required this.food,
    required this.addInfo,
    required this.addAdmin,
    required this.addChatRoom,
    required this.inviteMore,
    required this.hostedBy,
    required this.productId,
    required this.message,
    required this.userId,
    required this.customImage,
    required this.draft,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory CreateInvitationProductList.fromJson(Map<String, dynamic> json) =>
      CreateInvitationProductList(
        name: json["name"],
        date: DateTime.parse(json["date"]),
        zone: json["zone"],
        time: json["time"],
        location: json["location"],
        phone: json["phone"],
        typeEvents: json["type_events"],
        dressCode: json["dress_code"],
        food: json["food"],
        addInfo: json["add_info"],
        addAdmin: json["add_admin"],
        addChatRoom: json["add_chat_room"],
        inviteMore: json["invite_more"],
        hostedBy: json["hosted_by"],
        productId: json["product_id"],
        message: json["message"],
        userId: json["user_id"],
        customImage: json["custom_image"],
        draft: json["draft"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "zone": zone,
        "time": time,
        "location": location,
        "phone": phone,
        "type_events": typeEvents,
        "dress_code": dressCode,
        "food": food,
        "add_info": addInfo,
        "add_admin": addAdmin,
        "add_chat_room": addChatRoom,
        "invite_more": inviteMore,
        "hosted_by": hostedBy,
        "product_id": productId,
        "message": message,
        "user_id": userId,
        "custom_image": customImage,
        "draft": draft,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
