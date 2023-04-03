import 'package:flutter/material.dart';

// var height = MediaQuery.of(Get.context!).size.height;
// var width = MediaQuery.of(Get.context!).size.width;

Widget horizontalSpace(double width) => SizedBox(width: width);

Widget verticalSpace(double height) => SizedBox(height: height);

Widget divider({
  Color? color,
  double? height,
  double? thickness,
  double? indent,
  endIndent,
}) =>
    Divider(
      color: color,
      height: height,
      thickness: thickness,
      indent: indent ?? 15,
      endIndent: endIndent ?? 15,
    );

Widget verticalDivider({
  Color? color,
  double? width,
  double? thickness,
  double? indent,
  double? endIndent,
}) =>
    VerticalDivider(
      color: color,
      width: width ?? 1,
      thickness: thickness ?? 0.5,
      indent: indent ?? 2,
      endIndent: endIndent ?? 2,
    );
