import 'package:flutter/material.dart';
import 'package:movies_app/ui/shared_widgets/film_poster.dart';
import 'package:movies_app/utils/app_asset.dart';
import 'package:movies_app/utils/app_color.dart';

import '../../../../data/model/top_rated_response.dart';


class RecommendationWidget extends StatelessWidget {
  final List<TopRatedResult> data;
  final int index;

  const RecommendationWidget(
      {super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilmPoster(
          path: "https://image.tmdb.org/t/p/w500/${data[index].posterPath}",
          description: data[index].title,
          rating: data[index].voteAverage!,
          releaseDate: data[index].voteAverage!,
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(AppAsset.star),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '${data[index].voteAverage}',
                  style:
                      TextStyle(color: AppColor.white), // Customize the style
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '${data[index].releaseDate}',
              style: const TextStyle(color: AppColor.liteGrey, fontSize: 10, fontWeight: FontWeight.w400), // Customize the style
            ),
          ],
        )
      ],
    );
  }
}