import 'package:flutter/material.dart';
import 'package:movies_app/data/api_manager/api_manager.dart';
import 'package:movies_app/ui/shared_widgets/loading.dart';
import 'package:movies_app/ui/tabs/home_tab/new_releases_section/new_release_widget.dart';
import 'package:movies_app/ui/tabs/home_tab/popular_widgets/popular_widget.dart';
import 'package:movies_app/ui/tabs/home_tab/recomended_section/recomended_section.dart';
import 'package:movies_app/utils/app_color.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.backGroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            /// popular
            FutureBuilder(
              future: ApiManager.getPopular(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!;
                  return PopularWidget(data: data);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return const LoadingWidget();
                }
              },
            ),
            /// New Releases
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3096412556053812,
              child: FutureBuilder(
                  future: ApiManager.getNewRelease(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return NewReleaseWidget(data: snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return const LoadingWidget();
                    }
                  }),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0336322869955157,
            ),
            /// Recommendation
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4096412556053812,
              child: FutureBuilder(
                  future: ApiManager.getTopRated(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return RecommendedSection(data: snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return const LoadingWidget();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
