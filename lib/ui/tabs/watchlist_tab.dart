// import 'package:flutter/material.dart';
// import 'package:movies_app/data/model/movieDM.dart';
// import 'package:movies_app/data/model/popular_response.dart';
// import 'package:movies_app/data/model/result.dart';
// import 'package:movies_app/data/model/top_rated_response.dart';
// import 'package:movies_app/utils/app_color.dart';
// import 'package:provider/provider.dart';
//
// import '../../data/api_manager/api_manager.dart';
// import '../../utils/settings_provider.dart';
// import '../shared_widgets/loading.dart';
//

import 'package:flutter/cupertino.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// class WatchListTab extends StatefulWidget {
//
//   const WatchListTab({super.key});
//
//   @override
//   State<WatchListTab> createState() => _WatchListTabState();
// }
//
// class _WatchListTabState extends State<WatchListTab> {
//   static late SettingsProvider provider;
//
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       provider.refreshMoviesList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     provider = Provider.of(context);
//     return Container(
//       color: AppColor.primary,
//       child: FutureBuilder(
//         future: ApiManager.getTopRated(),
//         builder: (_, snapshot) {
//           if (snapshot.hasData) {
//             var data = snapshot.data!;
//             return Expanded(
//                 child: ListView.builder(
//                   itemCount: provider.movies.length,
//                   itemBuilder: (context, index) =>
//                       Container(),
//                 ));
//           } else if (snapshot.hasError) {
//             return Text(snapshot.error.toString());
//           } else {
//             return const LoadingWidget();
//           }
//         },
//       ),
//
//     );
//   }
// }
//
// class MovieWidget extends StatelessWidget {
//   final MovieDm dm;
//   final List<Result> data;
//   final int index;
//
//   const MovieWidget(
//       {super.key, required this.dm, required this.data, required this.index});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text(data[index].title!),
//     );
//   }
// }
