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
