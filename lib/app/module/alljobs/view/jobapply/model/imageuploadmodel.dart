class ImageUploadModel {
  ImageUploadModel({this.file, this.path, required String response});

  dynamic file;
  String? path;
  String? response;

  Map<String, dynamic> toJson() => {
        "path": path,
        "file": file,
        "responce": response,
      };
}
