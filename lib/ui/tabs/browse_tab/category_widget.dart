import 'package:flutter/material.dart';

import '../../../utils/app_asset.dart';
import '../../../utils/app_color.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  const CategoryWidget({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppAsset.clacket),
        Center(
          child: Text(
            categoryName??"",
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColor.white),
          ),
        )
      ],
    );
  }
}
