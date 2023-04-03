// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:testdemo/const/app_color.dart';
import 'package:testdemo/helper/space_widget.dart';

class LabelValueWidget extends StatelessWidget {
  final String value, label;
  LabelValueWidget({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: height * 0.019,
                fontWeight: FontWeight.bold,
              ),
        ),
        verticalSpace(5),
        Text(
          label,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: height * 0.016,
                color: AppColor.grayColor,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
