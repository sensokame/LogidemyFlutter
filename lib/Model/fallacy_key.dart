 class FallacyKey{
  FallacyKey({
    required this.key,
    required this.name
  });
  final String key;
  final String name;
  factory FallacyKey.fromJson(Map<String, dynamic> json){
    return FallacyKey(
        key: json['key'],
        name: json['name']
    );
  }
 }