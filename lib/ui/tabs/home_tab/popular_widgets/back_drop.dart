import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../data/model/popular_response.dart';
import '../../../shared_widgets/loading.dart';

class BackDrop extends StatelessWidget {
  final List<PopularResult> data;
  const BackDrop({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.2432735426008969,
          autoPlay: true,
          viewportFraction: 1,
          pauseAutoPlayOnManualNavigate: true,
          enlargeCenterPage: true),
      items: data.map((result) {
        return Stack(
          children: [
            CachedNetworkImage(
              imageUrl:
              "https://image.tmdb.org/t/p/w500/${result.backdropPath}",
              placeholder: (_, __) => const LoadingWidget(),
              errorWidget: (_, __, ___) => const Icon(Icons.error),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ],
        );
      }).toList(),
    );
  }
}
