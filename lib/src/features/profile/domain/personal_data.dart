import 'dart:convert';

// PersonalData Class
class PersonalData {
  final String name;
  final String bodyshape;
  final String skincolor;
  final String haircolor;
  final int height;
  // Konstruktor
  PersonalData({
    required this.name,
    required this.bodyshape,
    required this.skincolor,
    required this.haircolor,
    required this.height,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "bodyshape": bodyshape,
      "skincolor": skincolor,
      "haircolor": haircolor,
      "height": height,
    };
  }

  factory PersonalData.fromMap(Map<String, dynamic> map) {
    return PersonalData(
      name: map["name"],
      bodyshape: map["bodyshape"],
      skincolor: map["skincolor"],
      haircolor: map["haircolor"],
      height: map["height"],
    );
  }
}

void main() {
  String firestoreMap =
      '''{"name": "Shima", "bodyshape": "hourglass", "skincolor": "beige", "haircolor": "dark brown", "height": 160}''';
  Map<String, dynamic> dataAsMap = jsonDecode(firestoreMap);
  PersonalData data = PersonalData.fromMap(dataAsMap);
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
