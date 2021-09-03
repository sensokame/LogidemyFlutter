import 'dart:core';

class Fallacy{
  final String key;
  final String name;
  final String category;
  final String picture;
  final String description;
  final String example;
  final String readMore;
  final List<dynamic> signs;

  Fallacy({
    required this.key,
    required this.name,
    required this.category,
    required this.picture,
    required this.description,
    required this.example,
    required this.readMore,
    required this.signs
  });

  factory Fallacy.fromJson(Map<String, dynamic> json){
    return Fallacy(
        key: json['_id'],
        name: json['name'],
        category: json['category'],
        picture: json['picture'],
        description: json['description'],
        example: json['example'],
        readMore: json['read_more'],
        signs: json['signs']
    );
  }
}