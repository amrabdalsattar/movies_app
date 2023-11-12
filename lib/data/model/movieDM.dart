class MovieDm{
  late String? backDropPath;
  late String? title;
  late String? dateRelease;
  late String? overView;
  late String? id;
  MovieDm(this.title, this.overView, this.backDropPath, this.dateRelease);

  MovieDm.fromJson(Map json){
    title = json["title"];
    overView = json["overView"];
    dateRelease = json["dateRelease"];
    backDropPath = json["backDropPath"];
    id = json["id"];
  }

  Map<String, Object?> toJson(){
    return {
      "title" : title,
      "overView" : overView,
      "dateRelease" : dateRelease,
      "backDropPath" : backDropPath,
      "id": id,
    };
  }
}