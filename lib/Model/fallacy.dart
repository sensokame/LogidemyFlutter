import 'dart:core';

class Fallacy{
  final String key;
  final String name;
  final String category;
  final String picture;
  final String description;
  final String example;
  final Iterable<String> signs;

  const Fallacy(
      this.key,
      this.name,
      this.category,
      this.picture,
      this.description,
      this.example,
      this.signs
      );

  }