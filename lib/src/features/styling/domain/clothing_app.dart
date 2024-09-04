// Main Application

import 'package:flutter/foundation.dart';
import 'package:my_project_modame/src/features/profile/domain/personal_data.dart';

import 'clothing_recommendation.dart.dart';
import 'clothing_recommendation_engine.dart.dart';

class ClothingApp {
  final ClothingRecommendationEngine _engine = ClothingRecommendationEngine();
  void run() {
    // Get personal data
    final personaldata = getPersonalData();
    // Get clothing recommendations
    final recommendation = _engine.getRecommendation(BodyShape as BodyShape);
    debugPrint('Hello, ${personaldata.name}!');
    debugPrint('Your body shape is: ${personaldata.bodyshape}');
    debugPrint('Suitable clothes for your body shape:');
    for (final item in recommendation.suitableClothes) {
      debugPrint('- $item');
    }
    debugPrint('Unsuitable clothes for your body shape:');
    for (final item in recommendation.unsuitableClothes) {
      debugPrint('- $item');
    }
    // Provide additional suggestions based on skin and hair color
    provideSkinAndHairColorSuggestions(personaldata);
  }

  PersonalData getPersonalData() {
    // Implement logic to get personal data information
    return PersonalData(
      name: 'Shima Saber',
      bodyshape: 'Hourglass',
      skincolor: 'Beige',
      haircolor: 'Dark brown',
      height: 160,
    );
  }

  void provideSkinAndHairColorSuggestions(PersonalData personaldata) {
    debugPrint('Additional suggestions based on your skin and hair color:');
    // Implement logic to provide suggestions based on skin and hair color
    if (personaldata.skincolor == 'Fair' && personaldata.haircolor == 'Brown') {
      debugPrint(
          '- Consider earth-toned colors like beige, olive, and burgundy');
    } else if (personaldata.skincolor == 'Olive' &&
        personaldata.haircolor == 'Black') {
      debugPrint(
          '- Try jewel-toned colors like emerald, sapphire, and amethyst');
    }
    // Add more suggestions for different skin and hair color combinations
  }
}
