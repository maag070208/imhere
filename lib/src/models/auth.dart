// To parse this JSON data, do
//
//     final userAuth = userAuthFromJson(jsonString);

import 'dart:convert';

UserAuth userAuthFromJson(String str) => UserAuth.fromJson(json.decode(str));

String userAuthToJson(UserAuth data) => json.encode(data.toJson());

class UserAuth {

  String? id;
  String? email;
  String? name;
  String? paternalLastName;
  String? maternalLastName;
  String? phone;
  String? latitude;
  String? longitude;
  DateTime? time;


  UserAuth({
    this.id,
    this.email,
    this.name,
    this.paternalLastName,
    this.maternalLastName,
    this.phone,
    this.latitude,
    this.longitude,
    this.time,
  });


  factory UserAuth.fromJson(Map<String, dynamic> json) => UserAuth(
    id: json["_id"],
    email: json["Email"],
    name: json["Name"],
    paternalLastName: json["PaternalLastName"],
    maternalLastName: json["MaternalLastName"],
    phone: json["Phone"],
    latitude: json["Latitude"],
    longitude: json["Longitude"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Email": email,
    "Name": name,
    "PaternalLastName": paternalLastName,
    "MaternalLastName": maternalLastName,
    "Phone": phone,
    "Latitude": latitude,
    "Longitude": longitude,
    "time": time,
  };
}
