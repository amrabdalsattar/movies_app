import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/ui/shared_widgets/film_poster.dart';

import '../../../../data/model/popular_response.dart';
import '../../../../utils/app_color.dart';

class Poster extends StatelessWidget {
  final List<PopularResult> data;

  const Poster({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.1322869955156951,
        ),
        CarouselSlider(
          options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.2230941704035874,
              autoPlay: true,
              pauseAutoPlayOnManualNavigate: true,
              disableCenter: true,
              viewportFraction: 1,
              enlargeCenterPage: true),
          items: data.map((result) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: FilmPoster(
                          path:
                              "https://image.tmdb.org/t/p/w500/${result.posterPath}",),

                    )),
                Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 26),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 9,
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                result.title ?? "",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                result.releaseDate ?? "",
                                style: const TextStyle(
                                    fontSize: 10,
                                    color: AppColor.liteGrey,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
