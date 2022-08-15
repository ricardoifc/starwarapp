// To parse this JSON data, do
//
//     final peopleList = peopleListFromJson(jsonString);

import 'dart:convert';

PeopleList peopleListFromJson(String str) => PeopleList.fromJson(json.decode(str));

String peopleListToJson(PeopleList data) => json.encode(data.toJson());

class PeopleList {
  PeopleList({
    required this.count,
  });
  int count;

  factory PeopleList.fromJson(Map<String, dynamic> json) => PeopleList(
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
  };
}
