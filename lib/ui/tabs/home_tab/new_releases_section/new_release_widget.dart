import 'package:flutter/material.dart';
import 'package:movies_app/ui/shared_widgets/film_poster.dart';
import 'package:movies_app/ui/shared_widgets/section_title.dart';
import 'package:movies_app/utils/app_color.dart';

import '../../../../data/model/new_release_response.dart';
import '../../../screens/details_screen.dart';

class NewReleaseWidget extends StatelessWidget {
  final List<NewReleaseResult> data;

  const NewReleaseWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      color: AppColor.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SectionTitle(title: "New Releases"),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, int index) => InkWell(
                child: FilmPoster(
                  path:
                      "https://image.tmdb.org/t/p/w500/${data[index].posterPath}",
                  title: data[index].title,
                  releaseDate: data[index].releaseDate,
                  overView: data[index].overview,
                  rating: data[index].voteAverage,
                  backDrop: "https://image.tmdb.org/t/p/w500/${data[index].backdropPath}",
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                              movieId: data[index].id!,
                            )),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
