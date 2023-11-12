import 'package:flutter/material.dart';
import 'package:movies_app/ui/shared_widgets/film_poster.dart';
import 'package:movies_app/utils/app_asset.dart';
import 'package:movies_app/utils/app_color.dart';

import '../../../../data/model/top_rated_response.dart';
import '../../../screens/details_screen.dart';

class RecommendationWidget extends StatelessWidget {
  final List<TopRatedResult> data;
  final int index;

  const RecommendationWidget(
      {super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: FilmPoster(
            path: "https://image.tmdb.org/t/p/w500/${data[index].posterPath}",
            title: data[index].title,
            rating: data[index].voteAverage!,
            date: "${data[index].voteAverage}",
            backDrop: "https://image.tmdb.org/t/p/w500/${data[index].backdropPath}",
            overView: data[index].overview,
            movieId: data[index].id.toString(),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                DetailsScreen(movieId: data[index].id!,)),);
          },
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(AppAsset.star),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '${data[index].voteAverage}',
                  style:
                      const TextStyle(color: AppColor.white), // Customize the style
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '${data[index].releaseDate}',
              style: const TextStyle(
                  color: AppColor.liteGrey,
                  fontSize: 10,
                  fontWeight: FontWeight.w400), // Customize the style
            ),
          ],
        )
      ],
    );
  }
}
