import 'package:flutter/material.dart';
import 'package:movies_app/data/model/details_response.dart';

import '../../data/api_manager/api_manager.dart';
import '../shared_widgets/loading.dart';
class DetailsScreen extends StatefulWidget {
  final int movieId;

  const DetailsScreen({super.key, required this.movieId, });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: ApiManager.fetchMovieDetails(widget.movieId),
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            var data = snapshot.data as List<DetailsResults>;
              final movieDetails = data.first;
              return Container(
                child: Text(
                  movieDetails.title ?? "No Title",
                  style: TextStyle(fontSize: 20), // You can customize the style
                ),
              );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const LoadingWidget();
          }

        },
      ),
    );

  }
}