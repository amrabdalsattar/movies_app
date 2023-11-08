import 'package:flutter/material.dart';
import 'package:movies_app/ui/shared_widgets/film_poster.dart';
import 'package:movies_app/ui/shared_widgets/section_title.dart';
import 'package:movies_app/utils/app_color.dart';

import '../../../../data/model/new_release_response.dart';

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
              itemBuilder: (context, int index) => FilmPoster(
                path:
                    "https://image.tmdb.org/t/p/w500/${data[index].posterPath}",
                description: data[index].title,
              ),
            ),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
