import 'dart:convert';

Postmodel postmodelFromJson(String str) => Postmodel.fromJson(json.decode(str));

String postmodelToJson(Postmodel data) => json.encode(data.toJson());

class Postmodel {
    Postmodel({
        this.image,
        this.title,
        this.likes,
        this.comments,
    });

    String? image;
    String ?title;
    List<dynamic>? likes;
    List<dynamic> ?comments;

    factory Postmodel.fromJson(Map<String, dynamic> json) => Postmodel(
        image: json["image"],
        title: json["title"],
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "likes": List<dynamic>.from(likes!.map((x) => x)),
        "comments": List<dynamic>.from(comments!.map((x) => x)),
    };
}
