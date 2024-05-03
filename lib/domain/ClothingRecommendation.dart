// Body Shape Enum
enum BodyShape { rounded, triangle, hourglass, rectangle, inverted_triangle }
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
