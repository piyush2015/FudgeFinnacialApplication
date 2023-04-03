import 'package:flutter/material.dart';

import '../const/app_color.dart';
import '../helper/space_widget.dart';

class FinancialGoalIndicatorWidget extends StatelessWidget {
  const FinancialGoalIndicatorWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.progressPercentage,
    required this.progressBarColor,
  }) : super(key: key);

  final double width;
  final double height;
  final int progressPercentage;
  final Color progressBarColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "XX of total XX",
            style:
                TextStyle(color: AppColor.grayColor, fontSize: height * 0.016),
          ),
          verticalSpace(height * 0.01),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              backgroundColor: AppColor.grayColor,
              minHeight: height * 0.0045,
              value: progressPercentage / 100,
              color: progressBarColor,
            ),
          ),
        ],
      ),
    );
  }
}
