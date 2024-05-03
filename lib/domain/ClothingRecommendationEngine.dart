// Clothing Recommendation Engine

import 'ClothingRecommendation.dart';


class ClothingRecommendationEngine {
  final Map<BodyShape, ClothingRecommendation> _recommendations = {
    BodyShape.rounded: ClothingRecommendation(
      bodyShape: BodyShape.rounded,
      suitableClothes: ['A-line dresses', 'Empire waist tops', 'Flared pants'],
      unsuitableClothes: ['Tight-fitting clothes', 'Horizontal stripes'],
    ),
    BodyShape.triangle: ClothingRecommendation(
      bodyShape: BodyShape.triangle,
      suitableClothes: ['V-neck tops', 'Bootcut jeans', 'A-line skirts'],
      unsuitableClothes: ['Tight pants', 'Crop tops'],
    ),
    // Add more body shape recommendations here
  };
  ClothingRecommendation getRecommendation(BodyShape bodyShape) {
    return _recommendations[bodyShape]!;
  }
  List<String> getSuitableClothes(BodyShape bodyShape) {
    return _recommendations[bodyShape]!.suitableClothes;
  }
  List<String> getUnsuitableClothes(BodyShape bodyShape) {
    return _recommendations[bodyShape]!.unsuitableClothes;
  }
}
// Methode zur Abfrage der Empfehlungen basierend auf einer Körperform
  Type getRecommendation(BodyShape bodyShape) {
    return _recommendations;
  }
  
  class _recommendations {
  List<String>? get suitableClothes => null;
  
  List<String>? get unsuitableClothes => null;
  }

  // Methode zur Abfrage der geeigneten Kleidung für eine spezifische Körperform
  List<String>? getSuitableClothes(BodyShape bodyShape) {
    return _recommendations().suitableClothes;
  }

  // Methode zur Abfrage der ungeeigneten Kleidung für eine spezifische Körperform
  List<String>? getUnsuitableClothes(BodyShape bodyShape) {
   return _recommendations().unsuitableClothes;
  }

