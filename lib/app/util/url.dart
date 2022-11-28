class Url {
  static const baseUrl = "https://findmyjobapi.herokuapp.com";
  final register = "/register";
  final login = "/login";
  final jobPost = "$baseUrl/jobs/post";
  final postedjobs = "$baseUrl/jobs/postedjobs";
  final jobSearch = "$baseUrl/jobs/search";
  final applyjob = "$baseUrl/jobs/apply";
  final appliedjob = "$baseUrl/jobs/applied";
  final postSave = "$baseUrl/jobs/save";
  final imageUpload = "$baseUrl/upload/uploadimage";
  final getpost = "$baseUrl/post/posts";
}
