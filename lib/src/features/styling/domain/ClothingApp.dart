// Main Application

import 'package:my_project_modame/src/features/profile/domain/PersonalData.dart';

import 'ClothingRecommendation.dart';
import 'ClothingRecommendationEngine.dart';

class ClothingApp {
  final ClothingRecommendationEngine _engine = ClothingRecommendationEngine();
  void run() {
    // Get personal data
    final personaldata = getPersonalData();
    // Get clothing recommendations
    final recommendation = _engine.getRecommendation(BodyShape as BodyShape);
    print('Hello, ${personaldata.name}!');
    print('Your body shape is: ${personaldata.bodyShape}');
    print('Suitable clothes for your body shape:');
    for (final item in recommendation.suitableClothes) {
      print('- $item');
    }
    print('Unsuitable clothes for your body shape:');
    for (final item in recommendation.unsuitableClothes) {
      print('- $item');
    }
    // Provide additional suggestions based on skin and hair color
    provideSkinAndHairColorSuggestions(personaldata);
  }

  PersonalData getPersonalData() {
    // Implement logic to get personal data information
    return PersonalData(
      name: 'Shahrzad Zahraei',
      bodyShape: 'Inverted triangle',
      skinColor: 'Beige',
      hairColor: 'Dark brown',
      height: 160,
    );
  }

  void provideSkinAndHairColorSuggestions(PersonalData personaldata) {
    print('Additional suggestions based on your skin and hair color:');
    // Implement logic to provide suggestions based on skin and hair color
    if (personaldata.skinColor == 'Fair' && personaldata.hairColor == 'Brown') {
      print('- Consider earth-toned colors like beige, olive, and burgundy');
    } else if (personaldata.skinColor == 'Olive' &&
        personaldata.hairColor == 'Black') {
      print('- Try jewel-toned colors like emerald, sapphire, and amethyst');
    }
    // Add more suggestions for different skin and hair color combinations
  }
}
