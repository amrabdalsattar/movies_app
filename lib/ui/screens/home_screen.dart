import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/ui/tabs/browse_tab.dart';
import 'package:movies_app/ui/tabs/home_tab/home_tab.dart';
import 'package:movies_app/ui/tabs/search_tab.dart';
import 'package:movies_app/ui/tabs/watchlist_tab.dart';
import 'package:movies_app/utils/app_asset.dart';
import 'package:movies_app/utils/settings_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  List tabs = [
    const HomeTab(),
    const SearchTab(),
    const BrowseTab(),
    const WatchListTab()
  ];
  late SettingsProvider provider;
  static const routeName = "home";

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Scaffold(
      bottomNavigationBar: bottomNav(),
      body: tabs[provider.currentTabIndex],
    );
  }

  BottomNavigationBar bottomNav() => BottomNavigationBar(
    currentIndex: provider.currentTabIndex,
      onTap: (index){
      provider.currentTabChange(index);
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_filled), label: "HOME"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search), label: "SEARCH"),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAsset.browse)), label: "BROWSE"),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAsset.watchlist)), label: "WATCHLIST")
      ]);
}
