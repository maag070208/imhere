import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {

  String? email;
  String? name;
  String? paternalLastName;
  String? maternalLastName;
  String? phone;
  String? latitude;
  String? longitude;
  String? password;
  User({
    this.email,
    this.name,
    this.paternalLastName,
    this.maternalLastName,
    this.phone,
    this.latitude,
    this.longitude,
    this.password,
  });


  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json["Email"],
    name: json["Name"],
    paternalLastName: json["PaternalLastName"],
    maternalLastName: json["MaternalLastName"],
    phone: json["Phone"],
    latitude: json["Latitude"],
    longitude: json["Longitude"],
    password: json["Password"],
  );

  Map<String, dynamic> toJson() => {
    "Email": email,
    "Name": name,
    "PaternalLastName": paternalLastName,
    "MaternalLastName": maternalLastName,
    "Phone": phone,
    "Latitude": latitude,
    "Longitude": longitude,
    "Password": password
  };
}
