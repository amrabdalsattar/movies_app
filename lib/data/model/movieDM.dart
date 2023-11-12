class MovieDm{
  late String? backDropPath;
  late String? title;
  late String? date;
  late String? overView;
  late String? id;
  MovieDm(this.title, this.overView, this.backDropPath, this.date);

  MovieDm.fromJson(Map json){
    title = json["title"];
    overView = json["overView"];
    date = json["date"];
    backDropPath = json["backDrop"];
    id = json["id"];
  }

  Map<String, Object?> toJson(){
    return {
      "title" : title,
      "overView" : overView,
      "date" : date,
      "backDrop" : backDropPath,
      "id": id,
    };
  }
}