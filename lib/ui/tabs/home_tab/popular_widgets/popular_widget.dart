import 'package:flutter/material.dart';
import 'package:movies_app/ui/tabs/home_tab/popular_widgets/poster.dart';

import '../../../../data/model/popular_response.dart';
import 'back_drop.dart';

class PopularWidget extends StatelessWidget {
  final List<PopularResult> data;
  const PopularWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            BackDrop(data: data),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height *
                  0.1676233183856502,
            )
          ],
        ),
        Poster(data: data),
      ],
    );
  }
}
