import 'package:flutter/material.dart';
import 'package:movies_app/ui/tabs/search_tab/search_for_movies/search_for_movies.dart';
import 'package:movies_app/utils/app_asset.dart';

import '../../../utils/app_color.dart';

class SearchTab extends StatelessWidget {
  static const bool visible = true;
  static TextEditingController searchController = TextEditingController();

  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Search", style: TextStyle(fontSize: 25),),
        backgroundColor: AppColor.grey,
        elevation: 0,
        toolbarHeight: 100,
        leading:
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: IconButton(onPressed: (){
              showSearch(context: context, delegate: MoviesSearch());
            },
                icon: Icon(Icons.search), color: AppColor.primary,iconSize: 35,),
          ),
      ),
    );
  }
}