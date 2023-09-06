// class CreateListModel {
//   List<CreateDataList> data;
//
//   CreateListModel({
//     required this.data,
//   });
//
//   factory CreateListModel.fromJson(Map<String, dynamic> json) =>
//       CreateListModel(
//         data: List<CreateDataList>.from(
//             json["data"].map((x) => CreateDataList.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }
//
// class CreateDataList {
//   int id;
//   String name;
//   String email;
//   String mobileNumber;
//
//   CreateDataList({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.mobileNumber,
//   });
//
//   factory CreateDataList.fromJson(Map<String, dynamic> json) => CreateDataList(
//         id: json["id"],
//         name: json["Name"],
//         email: json["Email"],
//         mobileNumber: json["Mobile_Number"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "Name": name,
//         "Email": email,
//         "Mobile_Number": mobileNumber,
//       };
// }

class CreateListModel {
  List<CreateDataList> data;

  CreateListModel({
    required this.data,
  });

  factory CreateListModel.fromJson(Map<String, dynamic> json) =>
      CreateListModel(
        data: List<CreateDataList>.from(
            json["data"].map((x) => CreateDataList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CreateDataList {
  int id;
  String name;
  String email;
  String mobileNumber;

  CreateDataList({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
  });

  factory CreateDataList.fromJson(Map<String, dynamic> json) => CreateDataList(
        id: json["id"],
        name: json["Name"],
        email: json["Email"],
        mobileNumber: json["Mobile_Number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
        "Email": email,
        "Mobile_Number": mobileNumber,
      };
}
