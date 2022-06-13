import 'dart:convert';

UserDto userFromJson(String str) => UserDto.fromJson(json.decode(str));

String userToJson(UserDto data) => json.encode(data.toJson());

class UserDto {

  String? id;
  String? email;
  String? name;
  String? paternalLastName;
  String? maternalLastName;
  String? phone;
  String? latitude;
  String? longitude;
  UserDto({
    this.id,
    this.email,
    this.name,
    this.paternalLastName,
    this.maternalLastName,
    this.phone,
    this.latitude,
    this.longitude,
  });


  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
    id: json["_id"],
    email: json["Email"],
    name: json["Name"],
    paternalLastName: json["PaternalLastName"],
    maternalLastName: json["MaternalLastName"],
    phone: json["Phone"],
    latitude: json["Latitude"],
    longitude: json["Longitude"],
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
  };
}
