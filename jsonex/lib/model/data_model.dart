import 'dart:convert';

List<Information> informationFromJson(String str) => List<Information>.from(json.decode(str).map((x) => Information.fromJson(x)));

String informationToJson(List<Information> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Information {

  Information({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Information.fromJson(Map<String, dynamic> json) => Information(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };

}
