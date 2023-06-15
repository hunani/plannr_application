class LoginModel2 {
  LoginModel data;

  LoginModel2({
    required this.data,
  });

  factory LoginModel2.fromJson(Map<String, dynamic> json) => LoginModel2(
        data: LoginModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class LoginModel {
  String token;
  String firstName;
  int userId;
  String lastName;
  String phoneNumber;
  String email;
  String otp;

  LoginModel({
    required this.token,
    required this.firstName,
    required this.userId,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.otp,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        firstName: json["first_name"],
        userId: json["user_id"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        otp: json["otp"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "first_name": firstName,
        "user_id": userId,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "email": email,
        "otp": otp,
      };
}
