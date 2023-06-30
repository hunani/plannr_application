class ProfileModel {
  ProfileDataModel data;

  ProfileModel({
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        data: ProfileDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class ProfileDataModel {
  String image;
  String name;
  String email;

  ProfileDataModel({
    required this.image,
    required this.name,
    required this.email,
  });

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) =>
      ProfileDataModel(
        image: json["image"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "email": email,
      };
}
