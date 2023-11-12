import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_asset.dart';

import '../../../utils/app_color.dart';

class SearchTab extends StatelessWidget {
  static const bool visible = true;
  static TextEditingController searchController = TextEditingController();

  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.backGroundColor,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              SearchBar(
                controller: searchController,
                backgroundColor: const MaterialStatePropertyAll(AppColor.grey),
                hintText: "Search",
                leading: const Icon(
                  Icons.search,
                  color: AppColor.white,
                ),
                hintStyle: const MaterialStatePropertyAll(
                    TextStyle(color: AppColor.liteGrey)),
                textStyle: const MaterialStatePropertyAll(
                    TextStyle(color: AppColor.white)),
              ),
              Visibility(
                  visible: visible,
                  child: Expanded(child: Image.asset(AppAsset.filmNotFound)))
            ],
          ),
        ),
      ),
    );
  }
}
