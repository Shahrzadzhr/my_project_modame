// UserProfile Class
class UserProfile {
  final String id;
  final String profilePicUrl;
  final String vorname;
  final String nachname;
  final String birthdate;
  final String phonenumber;

  // Konstruktor
  UserProfile(this.id, this.profilePicUrl, this.vorname, this.nachname,
      this.birthdate, this.phonenumber);

// Methode zur Rückgabe einer formatierten Darstellung des Benutzerprofils
  String getFullName() {
    return vorname + nachname;
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
}
