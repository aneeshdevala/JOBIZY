import 'dart:convert';

Applymodel applymodelFromJson(String str) =>
    Applymodel.fromJson(json.decode(str));

String applymodelToJson(Applymodel data) => json.encode(data.toJson());

class Applymodel {
  Applymodel({
    this.jobId,
    this.fname,
    this.lname,
    this.email,
    this.phone,
    this.experience,
    this.resume,
    this.status,
  });

  String? jobId;
  String? fname;
  String? lname;
  String? status;
  String? email;
  int? phone;
  int? experience;
  String? resume;

  factory Applymodel.fromJson(Map<String, dynamic> json) => Applymodel(
        jobId: json["jobId"],
        fname: json["fname"],
        lname: json["lname"],
        email: json["email"],
        phone: json["phone"],
        experience: json["experience"],
        resume: json["resume"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "jobId": jobId,
        "fname": fname,
        "lname": lname,
        "email": email,
        "phone": phone,
        "experience": experience,
        "resume": resume,
        "status": status,
      };
}
