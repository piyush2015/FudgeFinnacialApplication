import 'package:flutter/material.dart';
import 'package:testdemo/common_widgets/content_heading_widget.dart';
import 'package:testdemo/common_widgets/transaction_list_widget.dart';
import 'package:testdemo/const/app_color.dart';
import 'package:testdemo/const/app_str.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.055,
            vertical: width * 0.059,
          ),
          child: ContentHeadingWidget(
            title: AppStr.recentTransection.toUpperCase(),
            buttonName: 'MORE',
            onTap: () {},
            isShowButton: false,
          ),
        ),
        Expanded(
          child: ListView.separated(
            // physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: ((context, index) {
              return TransactionListWidget(
                width: width,
                height: height,
                trailingTransactionStatusIcon: index == 0
                    ? 'assets/icons/in-progress.svg'
                    : 'assets/icons/check-circle-fill.svg',
                trailingTransactionStatusIconColor: index == 0
                    ? AppColor.inProgressIndicator
                    : AppColor.checkColor,
              );
            }),
            separatorBuilder: (context, index) {
              return SizedBox(height: height * 0.015);
            },
          ),
        ),
      ],
    );
  }
}
