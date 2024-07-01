import 'dart:convert';

enum BodyShape { rounded, triangle, hourglass, rectangle, invertedTriangle }

// Clothing Recommendation Class
class ClothingRecommendation {
  final BodyShape bodyShape;
  final List<String> suitableClothes;
  final List<String> unsuitableClothes;

  ClothingRecommendation({
    required this.bodyShape,
    required this.suitableClothes,
    required this.unsuitableClothes,
  });

  Map<String, dynamic> toMap() {
    return {
      "bodyShape": bodyShape.toString().split('.').last,
      "suitableClothes": suitableClothes,
      "unsuitableClothes": unsuitableClothes,
    };
  }

  factory ClothingRecommendation.fromMap(Map<String, dynamic> map) {
    return ClothingRecommendation(
      bodyShape: BodyShape.values
          .firstWhere((e) => e.toString().split('.').last == map["bodyShape"]),
      suitableClothes: List<String>.from(map["suitableClothes"]),
      unsuitableClothes: List<String>.from(map["unsuitableClothes"]),
    );
  }
}

void main() {
  String firestoreMap =
      '''{"bodyshape": "Shima", "bodyshape": "hourglass", "skincolor": "beige", "haircolor": "dark brown", "height": 160}''';
  Map<String, dynamic> recommendationAsMap = jsonDecode(firestoreMap);
  ClothingRecommendation recommendation =
      ClothingRecommendation.fromMap(recommendationAsMap);
}

// Methode, die eine lesbare Zusammenfassung der Kleidungsempfehlungen liefert
String getRecommendationSummary() {
  var suitableClothes;
  String suitableItems = suitableClothes(', ');
  var unsuitableClothes;
  String unsuitableItems = unsuitableClothes(', ');

  var bodyShape;
  return 'Empfehlungen für ${bodyShape.toString().split('.').last}:\n'
      'Geeignet: $suitableItems\n'
      'Ungeeignet: $unsuitableItems';
}
