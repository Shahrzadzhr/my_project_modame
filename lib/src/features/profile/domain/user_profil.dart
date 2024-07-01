import 'dart:convert';

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

  void main() {
    String firestoreMap =
        '''{"id": "Shima", "profilePicUrl": null, "vorname": "Shima", "nachname": "Saber", "birthdate": "23.04.1986", "phonenumber": "0176..."}''';
    Map<String, dynamic> userAsMap = jsonDecode(firestoreMap);
    UserProfile user = UserProfile.fromMap(userAsMap);
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
    // Formatierung der Telefonnummer könnte hier implementiert werden
    // Zum Beispiel: (012) 345-6789
    return phonenumber;
  }

// Methode zur Erzeugung einer Beschreibung des Benutzerprofils
  String getDescription() {
    return "Name: ${getFullName()}, Geburtsdatum: ${getBirthDate()}, Telefonnummer: ${getPhoneNumber()}";
  }
}
