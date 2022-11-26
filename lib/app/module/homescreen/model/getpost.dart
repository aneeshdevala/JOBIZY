// To parse this JSON data, do
//
//     final getpostmodel = getpostmodelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

List<Getpostmodel> getpostmodelFromJson(String str) => List<Getpostmodel>.from(json.decode(str).map((x) => Getpostmodel.fromJson(x)));

String getpostmodelToJson(List<Getpostmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Getpostmodel {
    Getpostmodel({
        this.id,
        this.image,
        this.title,
        this.userId,
        this.likes,
        this.comments,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    String? image;
    String? title;
    UserId? userId;
    List<Like>? likes;
    List<dynamic>? comments;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory Getpostmodel.fromJson(Map<String, dynamic> json) => Getpostmodel(
        id: json["_id"],
        image: json["image"],
        title: json["title"],
        userId: UserId.fromJson(json["userId"]),
        likes: List<Like>.from(json["likes"].map((x) => likeValues.map[x])),
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
        "title": title,
        "userId": userId?.toJson(),
        "likes": List<dynamic>.from(likes!.map((x) => likeValues.reverse[x])),
        "comments": List<dynamic>.from(comments!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

enum Like { THE_63512_AAC58_CEF49_DDF7_B26_F3, THE_63524_B8_D5_CC64_DAB83_F229_C3 }

final likeValues = EnumValues({
    "63512aac58cef49ddf7b26f3": Like.THE_63512_AAC58_CEF49_DDF7_B26_F3,
    "63524b8d5cc64dab83f229c3": Like.THE_63524_B8_D5_CC64_DAB83_F229_C3
});

class UserId {
    UserId({
        this.id,
        this.name,
    });

    Like? id;
    String? name;

    factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: likeValues.map[json["_id"]],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": likeValues.reverse[id],
        "name": name,
    };
}

class EnumValues<T> {
    Map<String, T> map = {};
    Map<T, String> reverseMap = {};

   EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap;
        return reverseMap;
    }
}
