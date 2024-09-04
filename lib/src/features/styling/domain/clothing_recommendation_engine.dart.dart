// Clothing Recommendation Engine

import 'clothing_recommendation.dart.dart';

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
