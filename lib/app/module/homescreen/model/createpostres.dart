// To parse this JSON data, do
//
//     final postresponcemodel = postresponcemodelFromJson(jsonString);

import 'dart:convert';

Postresponcemodel postresponcemodelFromJson(String str) =>
    Postresponcemodel.fromJson(json.decode(str));

String postresponcemodelToJson(Postresponcemodel data) =>
    json.encode(data.toJson());

class Postresponcemodel {
  Postresponcemodel({
    this.image,
    this.title,
    this.userId,
    this.likes,
    this.comments,
    this.id,
    this.message,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? image;
  String? title;
  String? userId;
  String? message;
  List<dynamic>? likes;
  List<dynamic>? comments;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Postresponcemodel.fromJson(Map<String, dynamic> json) =>
      Postresponcemodel(
        image: json["image"],
        title: json["title"],
        message: json["message"],
        userId: json["userId"],
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "userId": userId,
        "likes": List<dynamic>.from(likes!.map((x) => x)),
        "comments": List<dynamic>.from(comments!.map((x) => x)),
        "_id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
