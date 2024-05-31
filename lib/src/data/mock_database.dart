import 'package:my_project_modame/src/features/profile/domain/user_profil.dart';

import 'database_repository.dart';

class MockDatabase implements DatabaseRepository {
  // simulated database
  List<UserProfile> userprofiles = [
    UserProfile(
      "1",
      "https://ca.slack-edge.com/T044YC3MSLF-U0682748V1R-3d876dea5ee3-192",
      "Shahrzad",
      "Zahraei",
      "25.03.1988",
      "+49 176 202 56596",
    ),
    UserProfile(
      "2",
      "https://ca.slack-edge.com/T044YC3MSLF-U05GXAU2DH6-75f1f34f2c6f-72",
      "David",
      "Sent",
      "11.11.1995",
      "+49 151 301 35345",
    ),
  ];

  String getFullName() {
    return UserProfile(
            id, profilePicUrl, vorname, nachname, birthdate, phonenumber) +
        nachname;
  }

// Methode zur Darstellung des Geburtsdatums
  String getBirthDate() {
    return birthdate;
  }

// Methode zur Rückgabe der Telefonnummer als String
  String getPhoneNumber() {
    // Formatierung der Telefonnummer könnte hier implementiert werden
    // Zum Beispiel: (012) 345-6789
    return phonenumber.toString();
  }

// Methode zur Erzeugung einer Beschreibung des Benutzerprofils
  String getDescription() {
    return "Name: ${getFullName()}, Geburtsdatum: ${getBirthDate()}, Telefonnummer: ${getPhoneNumber()}";
  }

  @override
  Future<UserProfile?> getUser(String id) async {
    for (UserProfile currentUser in userprofiles) {
      if (currentUser.id == id) {
        // we have a match
        return currentUser;
      }
    }
    return null;
  }

  @override
  Future<void> addUser(UserProfile user) async {
    userprofiles.add(user);
  }
}
