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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Symbols &&
      other.name == name &&
      other.category == category &&
      other.imgUrl == imgUrl &&
      other.details == details &&
      other.usage == usage &&
      other.aka == aka &&
      other.summary == summary;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      category.hashCode ^
      imgUrl.hashCode ^
      details.hashCode ^
      usage.hashCode ^
      aka.hashCode ^
      summary.hashCode;
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
