// UserProfile Class

class UserProfile {
  final String id;
  final String email;
  String profilePicUrl;
  final String firstName;
  final String lastName;
  String birthdate;
  String phoneNumber;

  // Konstruktor
  UserProfile(
      {required this.id,
      required this.email,
      required this.profilePicUrl,
      required this.firstName,
      required this.lastName,
      required this.birthdate,
      required this.phoneNumber});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "profilePicUrl": profilePicUrl,
      "firstname": firstName,
      "lastname": lastName,
      "birthdate": birthdate,
      "phonenumber": phoneNumber,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map["id"],
      email: map["email"],
      profilePicUrl: map["profilePicUrl"],
      firstName: map["firstname"],
      lastName: map["lastname"],
      birthdate: map["birthdate"],
      phoneNumber: map["phonenumber"],
    );
  }

  String getFullName() {
    return '$firstName  $lastName';
  }

  String getBirthDate() {
    return birthdate;
  }

  String getPhoneNumber() {
    return phoneNumber;
  }

  String getDescription() {
    return "Name: ${getFullName()}, Geburtsdatum: ${getBirthDate()}, Telefonnummer: ${getPhoneNumber()}";
  }

  void setPhoneNumber(String phonenumber) {
    phoneNumber = phonenumber;
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  static UserProfile fromJson(Map<String, dynamic> json) {
    return UserProfile.fromMap(json);
  }
}
