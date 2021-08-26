import 'dart:convert';

import 'package:logidemy/Model/fallacy_key.dart';

class FallacyCategory{
  final String category;
  final Iterable<FallacyKey> fallacies;

  FallacyCategory({
    required this.category,
    required this.fallacies
  });

  factory FallacyCategory.fromJson(Map<String, dynamic> json){
    List<FallacyKey> list = [];
    for (var f in jsonDecode(json['fallacyKey'])){
      list.add(FallacyKey.fromJson(f));
    }
    return FallacyCategory(
        category: json['_id'],
        fallacies: list
    );
  }
}