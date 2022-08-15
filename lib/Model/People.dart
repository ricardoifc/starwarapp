import 'dart:convert';

People peopleFromJson(String str) => People.fromJson(json.decode(str));

String peopleToJson(People data) => json.encode(data.toJson());

class People {
  People({
    required this.name,
    required this.gender,
    required this.films,
  });

  String name;
  String gender;
  List<String> films;

  factory People.fromJson(Map<String, dynamic> json) => People(
    name: json["name"],
    gender: json["gender"],
    films: List<String>.from(json["films"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "gender": gender,
    "films": List<dynamic>.from(films.map((x) => x)),
  };
}
