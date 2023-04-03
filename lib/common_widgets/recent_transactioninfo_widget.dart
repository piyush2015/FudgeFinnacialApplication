import 'package:flutter/material.dart';
import 'package:testdemo/const/app_color.dart';
import 'package:testdemo/helper/space_widget.dart';

class RecentTransactionInfoWidget extends StatelessWidget {
  const RecentTransactionInfoWidget({
    Key? key,
    required this.height,
    required this.title,
    required this.value,
    required this.alignment,
  }) : super(key: key);

  final double height;
  final String title, value;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: AppColor.blackColor,
                fontSize: height * 0.016,
              ),
        ),
        verticalSpace(height * 0.005),
        Text(
          value,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: AppColor.grayColor,
                fontSize: 12,
              ),
        ),
      ],
    );
  }
}
