import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_color.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColor.primary,
      ),
    );
  }
}
