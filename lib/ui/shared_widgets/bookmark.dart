import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_asset.dart';

class Bookmark extends StatelessWidget {
  final bool isBookmarked;
  final VoidCallback onBookmarkPressed;

  const Bookmark({super.key,
    required this.isBookmarked,
    required this.onBookmarkPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBookmarkPressed,
      child: Image.asset(
        isBookmarked ? AppAsset.check : AppAsset.bookmark
      ),
    );
  }
}
