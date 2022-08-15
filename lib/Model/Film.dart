import 'dart:convert';

Film filmFromJson(String str) => Film.fromJson(json.decode(str));

String filmToJson(Film data) => json.encode(data.toJson());

class Film {
  Film({
    required this.title,
  });

  String title;

  factory Film.fromJson(Map<String, dynamic> json) => Film(
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
  };
}

