import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:movies_app/utils/app_asset.dart';

import '../data/model/movieDM.dart';

class SettingsProvider extends ChangeNotifier{
  int currentTabIndex = 0;
  String bookmark = AppAsset.bookmark;
  List<MovieDm> movies = [];

  void currentTabChange(index) {
    currentTabIndex = index;
    notifyListeners();
  }

  void bookmarkChange(){
    if(bookmark == AppAsset.bookmark){
      bookmark = AppAsset.check;
      notifyListeners();
    }else{
      bookmark = AppAsset.bookmark;
      notifyListeners();
    }
  }
  refreshMoviesList() async {
    CollectionReference<MovieDm> todosCollection = FirebaseFirestore.instance
        .collection("movies")
        .withConverter<MovieDm>(fromFirestore: (docSnapShot, _) {
      Map json = docSnapShot.data() as Map;
      MovieDm movie = MovieDm.fromJson(json);
      return movie;
    }, toFirestore: (movieDm, _) {
      return movieDm.toJson();
    });

    QuerySnapshot<MovieDm> todosSnapshot = await todosCollection
        .orderBy("date")
        .get();

    List<QueryDocumentSnapshot<MovieDm>> docs = todosSnapshot.docs;

    movies = docs.map((docSnapshot) {
      return docSnapshot.data();
    }).toList();

    notifyListeners();
  }
}