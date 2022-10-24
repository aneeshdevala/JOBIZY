import 'dart:convert';

Postedjobs postedjobsFromJson(String str) => Postedjobs.fromJson(json.decode(str));

String postedjobsToJson(Postedjobs data) => json.encode(data.toJson());

class Postedjobs {
    Postedjobs({
        this.id,
        this.userId,
        this.company,
        this.place,
        this.state,
        this.country,
        this.designation,
        this.jobFor,
        this.description,
        this.vacancy,
        this.jobType,
        this.salaryMin,
        this.salaryMax,
        this.applicationStatus,
        this.isBlocked,
        this.isOpen,
        this.reportMessages,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    String ?userId;
    String ?company;
    String ?place;
    String ?state;
    String ?country;
    String ?designation;
    String ?jobFor;
    String ?description;
    String ?vacancy;
    String ?jobType;
    int ?salaryMin;
    int ?salaryMax;
    List<dynamic> ?applicationStatus;
    bool? isBlocked;
    bool? isOpen;
    List<dynamic> ?reportMessages;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory Postedjobs.fromJson(Map<String, dynamic> json) => Postedjobs(
        id: json["_id"],
        userId: json["userId"],
        company: json["company"],
        place: json["place"],
        state: json["state"],
        country: json["country"],
        designation: json["designation"],
        jobFor: json["jobFor"],
        description: json["description"],
        vacancy: json["vacancy"],
        jobType: json["jobType"],
        salaryMin: json["salaryMin"],
        salaryMax: json["salaryMax"],
        applicationStatus: List<dynamic>.from(json["applicationStatus"].map((x) => x)),
        isBlocked: json["isBlocked"],
        isOpen: json["isOpen"],
        reportMessages: List<dynamic>.from(json["reportMessages"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "company": company,
        "place": place,
        "state": state,
        "country": country,
        "designation": designation,
        "jobFor": jobFor,
        "description": description,
        "vacancy": vacancy,
        "jobType": jobType,
        "salaryMin": salaryMin,
        "salaryMax": salaryMax,
        "applicationStatus": List<dynamic>.from(applicationStatus!.map((x) => x)),
        "isBlocked": isBlocked,
        "isOpen": isOpen,
        "reportMessages": List<dynamic>.from(reportMessages!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
