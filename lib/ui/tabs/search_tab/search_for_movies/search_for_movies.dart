import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/api_manager/api_manager.dart';
import 'package:movies_app/data/model/search_response.dart';
import 'package:movies_app/utils/app_color.dart';

import '../../../../utils/app_asset.dart';
import '../../../shared_widgets/loading.dart';

class MoviesSearch extends SearchDelegate {
  final num? id;
  MoviesSearch({this.id});
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: AppColor.white),
        labelStyle: TextStyle(color: AppColor.white),
      ),
      scaffoldBackgroundColor: AppColor.backGroundColor,

    );

  }

  bool visible = false;
  TextStyle textStyle = const TextStyle(
      fontSize: 13, fontWeight: FontWeight.w400, color: AppColor.liteGrey);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: const Icon(
            Icons.search,
            color: AppColor.black,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
         Navigator.pop(context);
      },
      icon: const Icon(Icons.clear),
      color: AppColor.black,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSearch(query),
      builder: (context, snapshot) {
        var data = snapshot.data;
        if (snapshot.hasData) {
          bool hasMatches = matchFunction(data, query);
          return Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: hasMatches
                ? ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return buildSearchWidgets(data, index);
              },
            )
                : Center(child: Image.asset(AppAsset.filmNotFound)),
          );
        } else if (snapshot.hasError) {
          return Text(
            snapshot.error.toString(),
            style: TextStyle(color: Colors.white),
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSearch(query),
      builder: (context, snapshot) {
        var data = snapshot.data;
        if (snapshot.hasData) {
          bool hasMatches = matchFunction(data, query);
          return Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 14),
            child: hasMatches
                ? ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return buildSearchWidgets(data, index);
              },
            )
                : Center(child: Image.asset(AppAsset.filmNotFound)),
          );
        } else if (snapshot.hasError) {
          return Text(
            snapshot.error.toString(),
            style: TextStyle(color: Colors.white),
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }



  Widget buildSearchWidgets(List<SearchResults>? data, int index) {
    return Column(
      children: [
        Row(
          children: [
            /// BackDrop
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://image.tmdb.org/t/p/w500/${data![index].backdropPath}",
                      errorWidget: (_, __, ___) =>
                          const Center(child: Icon(Icons.error)),
                      placeholder: (_, __) => const LoadingWidget(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),

            /// Descriptions
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data[index].title!,
                    style: const TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data[index].releaseDate ?? "",
                    style: textStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data[index].overview ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle,
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        const Divider(
          thickness: 1,
          color: AppColor.fadedGrey,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  bool matchFunction(List<SearchResults>? data, String q) {
    for (int i = 0; i < data!.length; i++) {
      if (data[i].title!.contains(q) ||
          data[i].overview!.contains(q)) {
        return true;
      }
    }
    return false;
  }

}
