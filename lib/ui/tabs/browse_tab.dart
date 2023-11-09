import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_asset.dart';
import 'package:movies_app/utils/app_color.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        elevation: 0,
      ),
      body: GridView.count(
        padding: EdgeInsets.only(left: 20),
          primary: false,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 1.6,
          children: <Widget>[
            Stack(
              children: [
                Image.asset(AppAsset.clacket),
                // const Center(
                const Center(
                  child: Text(
                    "Film",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColor.white),
                  ),
                )
              ],
            ),


          ]),
    );
  }
}
