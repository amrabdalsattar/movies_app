class GenresDm {
  GenresDm({
      List<Genre>? genres,}){
    _genres = genres;
}

  GenresDm.fromJson(dynamic json) {
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(Genre.fromJson(v));
      });
    }
  }
  List<Genre>? _genres;

  List<Genre>? get genres => _genres;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_genres != null) {
      map['genres'] = _genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 28
/// name : "Action"

class Genre {
  Genre({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Genre.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;

  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}