import 'package:flutter/material.dart';
import 'package:movies_app/data/api_manager/api_manager.dart';
import 'package:movies_app/ui/tabs/browse_tab/category_widget.dart';
import 'package:movies_app/ui/tabs/search_tab/search_for_movies/search_for_movies.dart';
import 'package:movies_app/utils/app_color.dart';

import '../../shared_widgets/loading.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Browse Category",
              style: TextStyle(
                color: AppColor.white,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
                child: FutureBuilder(
              future: ApiManager.getGenres(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    itemCount: snapshot.data?.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        childAspectRatio: 1.6,
                      ),

                      primary: false,
                      itemBuilder: (context, index) => InkWell(
                        onTap: (){

                          showSearch(context: context, delegate:
                          MoviesSearch(id: snapshot.data?[index].id));
                        },
                        child: CategoryWidget(
                            categoryName: snapshot.data![index].name!),
                      ));
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return const LoadingWidget();
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
