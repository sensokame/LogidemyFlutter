import 'package:logidemy/Model/fallacy_key.dart';

class FallacyCategory{
  final String category;
  final Iterable<FallacyKey> fallacies;

  const FallacyCategory(
      this.category,
      this.fallacies
      );
}