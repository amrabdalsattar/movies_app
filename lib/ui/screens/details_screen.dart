import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/model/MovieDetailsModel.dart';
import 'package:movies_app/data/model/similar_response.dart';
import 'package:movies_app/ui/shared_widgets/film_poster.dart';
import 'package:movies_app/utils/app_asset.dart';

import '../../data/api_manager/api_manager.dart';
import '../../utils/app_color.dart';
import '../shared_widgets/loading.dart';

class DetailsScreen extends StatefulWidget {
  final num? movieId;

  const DetailsScreen({
    super.key,
    required this.movieId,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.fetchMovieDetails(widget.movieId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data;
          final movieDetails = data;
          return buildDetailsWidget(movieDetails);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const LoadingWidget();
        }
      },
    );
  }

  Widget buildDetailsWidget(MovieDetailsModel? movieDetails) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.transparent,
          elevation: 0,
          title: Text("${movieDetails?.title}"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://image.tmdb.org/t/p/w500/${movieDetails?.backdropPath}",
                    placeholder: (_, __) => const LoadingWidget(),
                    errorWidget: (_, __, ___) => const Icon(Icons.error),
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieDetails?.title ?? "",
                      style: const TextStyle(
                          color: AppColor.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      movieDetails?.releaseDate ?? "",
                      style: const TextStyle(
                          color: AppColor.liteGrey,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: FilmPoster(
                          path:
                          "https://image.tmdb.org/t/p/w500/${movieDetails?.posterPath}",
                          backDrop:
                          "https://image.tmdb.org/t/p/w500/${movieDetails?.backdropPath}",
                              rating: movieDetails?.voteAverage,
                              overView: movieDetails?.overview,
                              date: movieDetails?.releaseDate,
                              title: movieDetails?.title,
                              allowedForThisWidget: false,
                              movieId: movieDetails?.id.toString(),
                        )),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movieDetails?.overview ?? "",
                                style: const TextStyle(
                                    color: AppColor.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                                maxLines: 7,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    AppAsset.star,
                                    scale: 0.6,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    "${movieDetails?.voteAverage}",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              FutureBuilder(
                  future: ApiManager.getSimilar(movieDetails?.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return buildSimilarFilmsSection(data: snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return const LoadingWidget();
                    }
                  }),
            ],
          ),
        ),
      );

  Widget buildSimilarFilmsSection({required List<SimilarResult> data}) =>
      Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            height: 60,
            color: AppColor.grey,
            child: const Text("More Like This", style: TextStyle(
              color: AppColor.white,
              fontSize: 18, fontWeight: FontWeight.w400
            ),),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5),
            height: MediaQuery.of(context).size.height * 0.2596412556053812,
            color: AppColor.grey,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Column(
                      children: [
                        FilmPoster(
                          path:
                              "https://image.tmdb.org/t/p/w500/${data[index].posterPath}",
                          title: data[index].title,
                          rating: data[index].voteAverage!,
                          date: data[index].releaseDate,
                          overView: data[index].overview,
                          backDrop: data[index].backdropPath,
                          movieId: data[index].id.toString(),

                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                  movieId: data[index].id,
                                )),
                      );
                    },
                  );
                }),
          ),
        ],
      );
}
