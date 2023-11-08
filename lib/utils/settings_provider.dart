import 'package:flutter/foundation.dart';
import 'package:movies_app/utils/app_asset.dart';

class SettingsProvider extends ChangeNotifier{
  int currentTabIndex = 0;
  String bookmark = AppAsset.bookmark;

  void currentTabChange(index) {
    currentTabIndex = index;
    notifyListeners();
  }

  void bookmarkChange(){
    if(bookmark == AppAsset.bookmark){
      bookmark = AppAsset.check;
      notifyListeners();
    }else{
      bookmark = AppAsset.bookmark;
      notifyListeners();
    }
  }
}