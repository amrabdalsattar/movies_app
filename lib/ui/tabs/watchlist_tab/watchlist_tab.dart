import 'package:flutter/material.dart';
import 'package:movies_app/ui/tabs/watchlist_tab/movie_in_watchlist_widget.dart';
import 'package:movies_app/utils/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_color.dart';

class WatchListTab extends StatefulWidget {

  const WatchListTab({super.key});

  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {
  late SettingsProvider provider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.refreshMoviesList();
    });

  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// WatchList Text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              "Watchlist",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: AppColor.white),
            ),
          ),

          /// The Widgets
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                    itemCount: provider.movies.length,
                    itemBuilder: (context, index) {
                       return MovieInWatchlistWidget(dataModel: provider.movies[index]);
                    }
                ),
              )
          )
        ],
      ),
    );
  }
}
