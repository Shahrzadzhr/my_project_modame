// UserProfile Class
import 'package:flutter/foundation.dart';

class UserProfile {
  final String id;
  final String email;
  String profilePicUrl;
  final String firstname;
  final String lastname;
  String birthdate;
  String phonenumber;

  // Konstruktor
  UserProfile(
      {required this.id,
      required this.email,
      required this.profilePicUrl,
      required this.firstname,
      required this.lastname,
      required this.birthdate,
      required this.phonenumber});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "profilePicUrl": profilePicUrl,
      "firstname": firstname,
      "lastname": lastname,
      "birthdate": birthdate,
      "phonenumber": phonenumber,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map["id"],
      email: map["email"],
      profilePicUrl: map["profilePicUrl"],
      firstname: map["firstname"],
      lastname: map["lastname"],
      birthdate: map["birthdate"],
      phonenumber: map["phonenumber"],
    );
  }

  String getFullName() {
    return '$firstname  $lastname';
  }

  String getBirthDate() {
    return birthdate;
  }

  String getPhoneNumber() {
    return phonenumber;
  }

  String getDescription() {
    return "Name: ${getFullName()}, Geburtsdatum: ${getBirthDate()}, Telefonnummer: ${getPhoneNumber()}";
  }

  void setPhoneNumber(String phonenumber) {
    this.phonenumber = phonenumber;
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  static UserProfile fromJson(Map<String, dynamic> json) {
    return UserProfile.fromMap(json);
  }
}

void main() {
  UserProfile user = UserProfile(
      id: "1",
      email: "hallo@gmail.com",
      profilePicUrl: "profilePicUrl",
      firstname: "Shahrzad",
      lastname: "Zahraei",
      birthdate: "25.03.1988",
      phonenumber: "+4917620256596");

  Map<String, dynamic> map = user.toMap();
  debugPrint("$map");

  UserProfile user2 = UserProfile.fromMap(map);
  debugPrint(user2.id);
  debugPrint(user2.getFullName());
  debugPrint(user2.getBirthDate());
  debugPrint(user2.getPhoneNumber());
  debugPrint(user2.getDescription());
}
