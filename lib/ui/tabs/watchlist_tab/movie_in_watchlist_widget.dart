import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/ui/shared_widgets/bookmark.dart';
import 'package:movies_app/ui/shared_widgets/loading.dart';

import '../../../data/model/movieDM.dart';
import '../../../utils/app_color.dart';

class MovieInWatchlistWidget extends StatefulWidget {
  final MovieDm dataModel;

  MovieInWatchlistWidget({super.key, required this.dataModel});

  @override
  State<MovieInWatchlistWidget> createState() => _MovieInWatchlistWidgetState();
}

class _MovieInWatchlistWidgetState extends State<MovieInWatchlistWidget> {
  bool isBookmarked = true;
  TextStyle textStyle = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColor.liteGrey
  );

  @override
  Widget build(BuildContext context) {
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
                      imageUrl: widget.dataModel.backDropPath!,
                      errorWidget: (_, __, ___)=>const Icon(Icons.error),
                      placeholder: (_, __) => const LoadingWidget(),

                    ),
                  ),
                  Bookmark(isBookmarked: isBookmarked, onBookmarkPressed: () {
                    setState(() {
                      isBookmarked = !isBookmarked;
                    });
                  })
                ],
              ),
            ),
            SizedBox(width: 10,),
            /// Descriptions
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.dataModel.title!, style:
                  const TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  ),
                  SizedBox(height: 10,),
                  Text(widget.dataModel.date!, style: textStyle,),
                  SizedBox(height: 10,),
                  Text(widget.dataModel.overView!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle,)
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 14,),
        const Divider(
          thickness: 1,
          color: AppColor.fadedGrey,
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}
