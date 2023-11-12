import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/settings_provider.dart';
import 'package:provider/provider.dart';

import 'bookmark.dart';
import 'loading.dart';

class FilmPoster extends StatefulWidget {
  final String path;
  final String? backDrop;
  final String? title;
  final num? rating;
  final String? movieId;
  final String? date;
  final String? overView;
  final bool allowedForThisWidget;

  const FilmPoster({
    super.key,
    required this.path,
    this.rating,
    this.date,
    this.backDrop = "",
    this.title,
    this.overView,
    this.allowedForThisWidget = true,
    required this.movieId,
  });

  @override
  _FilmPosterState createState() => _FilmPosterState();
}

class _FilmPosterState extends State<FilmPoster> {
  bool isBookmarked = false;
  late SettingsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Container(
      width: 100,
      height: 200, // Increased the height to accommodate additional details
      margin: const EdgeInsets.only(left: 14),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: widget.path,
              placeholder: (_, __) => const LoadingWidget(),
              errorWidget: (_, __, ___) => const Icon(Icons.error),
            ),
            if (widget.title != null && widget.allowedForThisWidget)
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    AppColor.transparent,
                    AppColor.black
                  ]),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Text(
                  widget.title!,
                  style: const TextStyle(color: Colors.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            Bookmark(
              isBookmarked: isBookmarked,
              onBookmarkPressed: () {
                setState(() {
                  isBookmarked = !isBookmarked;
                  if(isBookmarked){
                    addMovieToWishList();
                    provider.refreshMoviesList();
                  }else{
                    provider.deleteDocument(widget.movieId!);
                    provider.refreshMoviesList();
                  }

                });
              },
            ),
            // Adding the rating and release date
          ],
        ),
      ),
    );
  }

  void addMovieToWishList() {
    CollectionReference moviesCollectionRef =
        FirebaseFirestore.instance.collection("movies");
    DocumentReference newEmptyDoc = moviesCollectionRef.doc();
    newEmptyDoc.set({
      "title": widget.title,
      "backDrop": widget.backDrop,
      "date": widget.date,
      "overView": widget.overView,
      "id": widget.movieId,
    }).timeout(const Duration(milliseconds: 300), onTimeout: () {
      provider.refreshMoviesList();
    });
  }
}
