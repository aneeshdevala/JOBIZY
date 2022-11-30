// To parse this JSON data, do
//
//     final appliedmodel = appliedmodelFromJson(jsonString);

import 'dart:convert';

List<Appliedmodel> appliedmodelFromJson(String str) => List<Appliedmodel>.from(json.decode(str).map((x) => Appliedmodel.fromJson(x)));

String appliedmodelToJson(List<Appliedmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Appliedmodel {
    Appliedmodel({
        this.id,
        this.company,
        this.designation,
        this.applicationStatus,
    });

    String? id;
    String? company;
    String? designation;
    ApplicationStatus? applicationStatus;

    factory Appliedmodel.fromJson(Map<String, dynamic> json) => Appliedmodel(
        id: json["_id"],
        company: json["company"],
        designation: json["designation"],
        applicationStatus: ApplicationStatus.fromJson(json["applicationStatus"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "company": company,
        "designation": designation,
        "applicationStatus": applicationStatus?.toJson(),
    };
}

class ApplicationStatus {
    ApplicationStatus({
        this.fname,
        this.lname,
        this.email,
        this.phone,
        this.experience,
        this.resume,
        this.userId,
        this.appliedAt,
        this.status,
        this.id,
    });

    String? fname;
    String? lname;
    String? email;
    int? phone;
    int? experience;
    dynamic resume;
    String? userId;
    DateTime? appliedAt;
    String? status;
    String? id;

    factory ApplicationStatus.fromJson(Map<String, dynamic> json) => ApplicationStatus(
        fname: json["fname"],
        lname: json["lname"],
        email: json["email"],
        phone: json["phone"],
        experience: json["experience"],
        resume: json["resume"],
        userId: json["userId"],
        appliedAt: DateTime.parse(json["appliedAt"]),
        status: json["status"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "fname": fname,
        "lname": lname,
        "email": email,
        "phone": phone,
        "experience": experience,
        "resume": resume,
        "userId": userId,
        "appliedAt": appliedAt?.toIso8601String(),
        "status": status,
        "_id": id,
    };
}
