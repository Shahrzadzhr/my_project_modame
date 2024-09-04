import 'dart:convert';

import 'package:flutter/foundation.dart';

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

// Methode, die eine lesbare Zusammenfassung der Kleidungsempfehlungen liefert
  String getRecommendationSummary() {
    String suitableItems = suitableClothes.join(', ');
    String unsuitableItems = unsuitableClothes.join(', ');

    return 'Empfehlungen für ${bodyShape.toString().split('.').last}:\n'
        'Geeignet: $suitableItems\n'
        'Ungeeignet: $unsuitableItems';
  }
}

void main() {
  String firestoreMap =
      '''{"bodyShape": "invertedtriangle", "suitableClothes": ["weite Hose", "klein printed Blouse"], "unsuitableClothes": ["Skinny jeans", "bold printed Blouse"]}''';
  Map<String, dynamic> recommendationAsMap = jsonDecode(firestoreMap);
  ClothingRecommendation recommendation =
      ClothingRecommendation.fromMap(recommendationAsMap);

  debugPrint(recommendation.getRecommendationSummary());
}
