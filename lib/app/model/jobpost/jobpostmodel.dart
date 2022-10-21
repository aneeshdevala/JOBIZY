class JobpostModel {
  String? companyname;
  String? place;
  String? state;
  String? country;
  String? jobtitle;
  String? jobdescription;
  String? jobtype;
  String? jobcategory;
  String? designation;
  String? expmin;
  String? expmax;
  num? salarymin;
  num? salarymax;
  String? salarytype;
  String? qualification;
  String? vaccancies;
  String? image;
  String? applicattionstatus;

    JobpostModel(
      {this.companyname,
      this.place,
      this.state,
      this.country,
      this.jobtitle,
      this.jobdescription,
      this.jobtype,
      this.jobcategory,
      this.designation,
      this.expmin,
      this.expmax,
      this.salarymin,
      this.salarymax,
      this.salarytype,
      this.qualification,
      this.vaccancies,
      this.image,
      this.applicattionstatus});
     
  factory JobpostModel.fromJson(Map<String, dynamic> json) => JobpostModel(
        companyname: json["companyname"] ?? "",
        place: json["place"] ?? "",
        state: json["state"] ?? "",
        country: json["country"] ?? "",
        jobtitle: json["jobtitle"] ?? "",
        jobdescription: json["jobdescription"] ?? "",
        jobtype: json["jobtype"] ?? "",
        jobcategory: json["jobcategory"] ?? "",
        designation: json["designation"] ?? "",
        expmin: json["expmin"] ?? "",
        expmax: json["expmax"] ?? "",
        salarymin: json["salarymin"] ?? "",
        salarymax: json["salarymax"] ?? "",
        salarytype: json["salarytype"] ?? "",
        qualification: json["qualification"] ?? "",
        vaccancies: json["vaccancies"] ?? "",
        image: json["image"] ?? "",
        applicattionstatus: json["applicattionstatus"] ?? "",
      );

}
