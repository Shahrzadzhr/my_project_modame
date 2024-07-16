// UserProfile Class
class UserProfile {
  final String id;
  final String profilePicUrl;
  final String vorname;
  final String nachname;
  final String birthdate;
  final String phonenumber;

  // Konstruktor
  UserProfile(
      {required this.id,
      required this.profilePicUrl,
      required this.vorname,
      required this.nachname,
      required this.birthdate,
      required this.phonenumber});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "profilePicUrl": profilePicUrl,
      "vorname": vorname,
      "nachname": nachname,
      "birthdate": birthdate,
      "phonenumber": phonenumber,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map["id"],
      profilePicUrl: map["profilePicUrl"],
      vorname: map["vorname"],
      nachname: map["nachname"],
      birthdate: map["birthdate"],
      phonenumber: map["phonenumber"],
    );
  }

// Methode zur Rückgabe einer formatierten Darstellung des Benutzerprofils
  String getFullName() {
    return '$vorname  $nachname';
  }

// Methode zur Darstellung des Geburtsdatums
  String getBirthDate() {
    return birthdate;
  }

// Methode zur Rückgabe der Telefonnummer als String
  String getPhoneNumber() {
    return phonenumber;
  }

// Methode zur Erzeugung einer Beschreibung des Benutzerprofils
  String getDescription() {
    return "Name: ${getFullName()}, Geburtsdatum: ${getBirthDate()}, Telefonnummer: ${getPhoneNumber()}";
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
      profilePicUrl: "profilePicUrl",
      vorname: "Shahrzad",
      nachname: "Zahraei",
      birthdate: "25.03.1988",
      phonenumber: "+4917620256596");

  Map<String, dynamic> map = user.toMap();
  print(map);

  UserProfile user2 = UserProfile.fromMap(map);
  print(user2.id);
  print(user2.getFullName());
  print(user2.getBirthDate());
  print(user2.getPhoneNumber());
  print(user2.getDescription());
}
