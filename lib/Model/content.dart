class Content {
  final String key;
  final String title;
  final String picture;
  final String text;
  Content({
    required this.key,
    required this.title,
    required this.picture,
    required this.text
  });
  factory Content.fromJson(Map<String, dynamic> json){
    return Content(
        key: json['_id'],
        title: json['title'],
        picture: json['picture'],
        text: json['text']
    );
  }
}