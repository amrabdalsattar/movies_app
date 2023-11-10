class MovieDm{
  late String? backDropPath;
  late String? title;
  late String? dateRelease;
  late String? description;
  late String? id;
  MovieDm(this.title, this.description, this.backDropPath, this.dateRelease);

  MovieDm.fromJson(Map json){
    title = json["title"];
    description = json["description"];
    dateRelease = json["dateRelease"];
    backDropPath = json["backDropPath"];
    id = json["id"];
  }

  Map<String, Object?> toJson(){
    return {
      "title" : title,
      "description" : description,
      "dateRelease" : dateRelease,
      "backDropPath" : backDropPath,
      "id": id,
    };
  }
}