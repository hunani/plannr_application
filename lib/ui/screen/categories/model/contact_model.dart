import 'package:contacts_service/contacts_service.dart';

class ContactsModel {
  int kittyId;
  List<ContactsListNameAndNumber> lists;

  ContactsModel({
    required this.kittyId,
    required this.lists,
  });

  Map<String, dynamic> toJson() => {
        "user_id": kittyId,
        "contact_list": List<dynamic>.from(lists.map((x) => x.toJson())),
      };
}

class ContactsListNameAndNumber {
  String name;
  String number;
  String email;
  ContactsListNameAndNumber({
    required this.name,
    required this.number,
    required this.email,
  });

  factory ContactsListNameAndNumber.fromJson(Map<String, dynamic> json) =>
      ContactsListNameAndNumber(
        name: json["name"],
        number: json["number"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "number": number,
        "email": email,
      };
}
