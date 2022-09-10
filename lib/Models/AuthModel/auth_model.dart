import 'dart:convert';

UserAuthModel userAuthModelFromJson(String str) => UserAuthModel.fromJson(json.decode(str));

String userAuthModelToJson(UserAuthModel data) => json.encode(data.toJson());

User userModelFromJson(String str) => User.fromJson(json.decode(str));

class UserAuthModel {
  UserAuthModel({
    required this.user,
    this.token = '',
  });

  User user;
  String? token;

  factory UserAuthModel.fromJson(Map<String, dynamic> json) => UserAuthModel(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  User({
    this.token = "",
    required this.id,
    required this.userName,
    required this.email,
    required this.googleId,
    this.contactNumber,
    this.profileUrl,
    this.dateOfBirth,
  });

  dynamic token;
  String id;
  String userName;
  String email;
  String googleId;
  String? contactNumber;
  String? profileUrl;
  String? dateOfBirth;

  factory User.fromJson(Map<String, dynamic> json) => User(
        token: json["token"],
        id: json["_id"],
        userName: json["userName"] ?? "",
        email: json["email"] ?? "",
        googleId: json["googleId"],
        contactNumber: json["contactNumber"],
        profileUrl: json["profileUrl"],
        dateOfBirth: json["dateOfBirth"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "_id": id,
        "userName": userName,
        "email": email,
        "googleId": googleId,
        "contactNumber": contactNumber,
        "profileUrl": profileUrl,
        "dateOfBirth": dateOfBirth,
        "mobileNumber": contactNumber,
      };
}
