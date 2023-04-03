import 'package:flutter/material.dart';
import 'package:testdemo/const/app_color.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    Key? key,
    required this.pagerIndex,
    required this.totalPages,
  }) : super(key: key);

  final int totalPages;
  final int pagerIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < totalPages; i++)
              Row(
                children: [
                  Container(
                    width: pagerIndex == i ? 15 : 8,
                    height: 6,
                    decoration: BoxDecoration(
                      color: pagerIndex == i
                          ? AppColor.blackColor
                          : AppColor.grayColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
