import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/utils/settings_provider.dart';
import 'package:provider/provider.dart';

import 'bookmark.dart';
import 'loading.dart';

class FilmPoster extends StatefulWidget {
  final String path;
  final String? title;
  final String? backDrop;
  final String? description;
  final double? rating;
  final double? releaseDate;

  const FilmPoster({
    super.key,
    required this.path,
    this.description,
    this.rating,
    this.releaseDate, this.backDrop = "", this.title = "",
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
            if (widget.description != null)
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Text(
                  widget.description!,
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
      "description": widget.description,
      "date": widget.releaseDate,
      "id": newEmptyDoc.id,
    }).timeout(const Duration(milliseconds: 300), onTimeout: () {
      provider.refreshMoviesList();
    });
  }
}
