class Symbols {
  String name;
  String imgUrl;

  Symbols({
    required this.name,
    required this.imgUrl
  });

  factory Symbols.fromJson(Map<String, dynamic> json) {
    return Symbols(
      name: json['name'],
      imgUrl: json['imgUrl'],
    );
  }

  toJson() {}
}