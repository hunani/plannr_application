class SignUpModel {
  String token;
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  int otp;

  SignUpModel({
    required this.token,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.otp,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        token: json["token"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "email": email,
        "otp": otp,
      };
}
