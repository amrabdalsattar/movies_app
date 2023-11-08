import 'package:flutter/material.dart';
import 'package:movies_app/ui/shared_widgets/section_title.dart';
import 'package:movies_app/ui/tabs/home_tab/recomended_section/recommendation_widget.dart';

import '../../../../data/model/top_rated_response.dart';
import '../../../../utils/app_color.dart';

class RecommendedSection extends StatelessWidget {
  final List<TopRatedResult> data;

  const RecommendedSection({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      color: AppColor.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SectionTitle(title: "Recommended"),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, int index) =>
                  RecommendationWidget(data: data, index: index),
            ),
          ),
        ],
      ),
    );
  }
}
