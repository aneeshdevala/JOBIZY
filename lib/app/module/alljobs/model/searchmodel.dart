class Searchmodel {
  Searchmodel({
    this.designation,
  });

  String? designation;

  Map<String, dynamic> toJson() => {
        "designation": designation,
      };
}
