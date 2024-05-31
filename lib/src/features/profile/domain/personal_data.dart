// PersonalData Class
// ignore_for_file: prefer_typing_uninitialized_variables

class PersonalData {
  final String name;
  final String bodyShape;
  final String skinColor;
  final String hairColor;
  final int height;
  // Konstruktor
  PersonalData({
    required this.name,
    required this.bodyShape,
    required this.skinColor,
    required this.hairColor,
    required this.height,
  });
}

// Methode, um die Informationen des Benutzers als String zurückzugeben
String getDescription() {
  // ignore: duplicate_ignore
  // ignore: prefer_typing_uninitialized_variables
  var name;
  var bodyShape;
  var skinColor;
  var hairColor;
  var height;
  return 'Name: $name, Body Shape: $bodyShape, Skin Color: $skinColor, Hair Color: $hairColor, Height: $height cm';
}
