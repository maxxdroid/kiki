class Symbols {
  String name;
  String category;
  String imgUrl;
  String details;
  String usage;
  String aka;
  String summary;

  Symbols({
    required this.name,
    required this.imgUrl,
    required this.category,
    required this.details,
    required this.usage,
    required this.aka,
    required this.summary
  });

  factory Symbols.fromJson(Map<String, dynamic> json) {
    return Symbols(
      name: json['name'],
      imgUrl: json['imgUrl'],
      details: json['details'],
      usage: json['usage'],
      category: json['category'],
      aka: json['aka'],
      summary: json['summary']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imgUrl': imgUrl,
      'details': details,
      'usage': usage,
      'category': category,
      'aka': aka,
      'summary': summary
    };
  }
}
