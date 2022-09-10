import 'dart:convert';

AddLocationModel addLocationModelFromJson(String str) =>
    AddLocationModel.fromJson(json.decode(str));

String addLocationModelToJson(AddLocationModel data) => json.encode(data.toJson());

class AddLocationModel {
  AddLocationModel({
    required this.message,
    required this.displayLocation,
  });

  String message;
  DisplayLocation displayLocation;

  factory AddLocationModel.fromJson(Map<String, dynamic> json) => AddLocationModel(
        message: json["message"],
        displayLocation: DisplayLocation.fromJson(json["displayLocation"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "displayLocation": displayLocation.toJson(),
      };
}

class DisplayLocation {
  DisplayLocation({
    required this.address,
    required this.lat,
    required this.lng,
    required this.isShown,
    required this.userId,
    required this.id,
    required this.v,
  });

  String address;
  String lat;
  String lng;
  bool isShown;
  String userId;
  String id;
  int v;

  factory DisplayLocation.fromJson(Map<String, dynamic> json) => DisplayLocation(
        address: json["address"],
        lat: json["lat"],
        lng: json["lng"],
        isShown: json["isShown"],
        userId: json["userId"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "lat": lat,
        "lng": lng,
        "isShown": isShown,
        "userId": userId,
        "_id": id,
        "__v": v,
      };
}
